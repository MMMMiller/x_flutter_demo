///文件名:    bc_web_view
///创建时间:  2022/9/21 on 14:04
///描述:
///
///@author   xueml

import 'package:common_lib/service/router/common_router.dart';
import 'package:flutter/material.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/upload_file/upload_file_bloc.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:common_lib/components/bottom_sheet/bottom_sheet.dart';


class BcWebView extends StatefulWidget {
  final String link;
  final WebViewCreatedCallback? webViewCreatedCallback;
  final PageFinishedCallback? pageFinishedCallback;
  final Set<JavascriptChannel>? javascriptChannels;
  final void Function(int state)? orderListStateCallback;
  final void Function(String state)? getTitle;
  const BcWebView({
    required this.link,
    super.key,
    this.webViewCreatedCallback,
    this.javascriptChannels,
    this.pageFinishedCallback,
    this.orderListStateCallback,
    this.getTitle,
  });

  @override
  State<StatefulWidget> createState() => BcWebViewState();
}

class BcWebViewState extends BaseState<BcWebView>  with WidgetsBindingObserver{
  double _progress = 0;
  final ImagePicker _imagePicker = ImagePicker();
  late WebViewController? controller;
  final GlobalKey<BcWebViewState> _key = GlobalKey();

  final String suffix = 'window.eventHub';
  late StreamSubscription _subscription;
  late String callbackId;
  late XFile xFile;
  late String url;


  // 这里配置通用的工具型Channel
  final Set<JavascriptChannel> javascriptChannelsWrap = {
    IsAppChannel().createJavascriptChannel(),
    FilePreviewChannel().createJavascriptChannel(),
    ToTelPhone().createJavascriptChannel(),
    GetH5Token().createJavascriptChannel(),
    ToBrowserPayChannel().createJavascriptChannel(),
    BackChannel().createJavascriptChannel(),
    // SetTitleChannel.createJavascriptChannel(),
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          key: _key,
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            controller = webViewController;
          },
          onPageFinished: widget.pageFinishedCallback,
          javascriptChannels: javascriptChannelsWrap,
          initialMediaPlaybackPolicy:AutoMediaPlaybackPolicy.always_allow,
          gestureNavigationEnabled: true,
          onProgress: (int progress) {
            setState(() {
              _progress = progress / 100.0;
            });
          },
        ),
        Visibility(
          visible: _progress != 1,
          child: LinearProgressIndicator(
            value: _progress,
            color: ColorsConfig.primaryColor,
          ),
        ),
      ],
    );
  }



// 通用业务channel，可以注入到底层WebView给到其他业务模块调用
  List<JavascriptChannel> getCustomeChannel() => [
    SelectImageChannel(
      voidCallback: (data)  {
        chooseImage(context,cameraEvent: () async {
          handleImage(ImageSource.camera,data);
        },photoEvent:() async{
          handleImage(ImageSource.gallery,data);
        }, );
      },
    ).createJavascriptChannel(),
    LoginChannel(
      voidCallback:  () async{
        final token = SharedPreferencesUtil.getString("token");
        if(!isEmpty(token)){
          if(!url.contains("token")){
            url = '$url&token=$token';
          } else{
          // url中的token可能是过期token 用最新token的去替换
           final List UrlStrArr =  url.split("token=");
           url = '${UrlStrArr[0]}token=$token';
          }
         await controller?.runJavascriptReturningResult( "window.location.replace('${url}');");
        } else {
          RouterUtil.instance.pop();
        }
      },
    ).createJavascriptChannel(),
    SetTitleChannel(titleCallback: (title){
      widget.getTitle?.call(title);
    }).createJavascriptChannel(),
    EnterOrderListChannel(voidCallback: (){
      print("进入订单列表");
      widget.orderListStateCallback?.call(1);
      },).createJavascriptChannel(),
    LeaveOrderListChannel(voidCallback: (){
      print("离开订单列表");
      widget.orderListStateCallback?.call(0);
    },).createJavascriptChannel(),
  ];

  void handleImage(source,data) async{

    try {
      if (!await BCPermissions.requestPermission(
        context,
        source == ImageSource.camera ? "camera" : "photos",
      )) {
        return;
      }
      final xFile =
      await _imagePicker.pickImage(source: source);
      if (xFile == null) {
        return;
      }
      uploadFile(xFile, '${data['callbackId']}');
    } catch (err) {
      Log.e('err: $err');
    }
  }

  @override
  void initState() {
    super.initState();
    url = widget.link;
    WidgetsBinding.instance.addObserver(this);
    if(widget.javascriptChannels != null) {
      javascriptChannelsWrap.addAll(widget.javascriptChannels!);
    }
    javascriptChannelsWrap.addAll(getCustomeChannel());

    injectBloc(UploadFileBloc()..setView(this));
    _subscription = uploadFileBloc.stream.listen((event) async {
      if (event is UploadingSuccessState) {
        await evaluateJavascript(
          callbackId,
          json.encode({
            'fileUrl': event.url,
            'fileName': xFile.name,
          }),
        );
      }
    });
  }

  Future<void>? evaluateJavascript(String callBackId, String params) {
    final info = "$suffix['$callBackId']($params)";
    return controller?.runJavascript(info);
  }

  UploadFileBloc get uploadFileBloc => getBc<UploadFileBloc>();

  void uploadFile(XFile file, String callbackId) {
    this.callbackId = callbackId;
    xFile = file;
    uploadFileBloc.uploadFile(File(file.path));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed) {
    //   print(' 请求后端接口，刷新订单状态 ');
    //   //  执行请求H5的方法
    //   evaluateJavascript(
    //     'CheckPayStatus', ''
    //   );
    //   // controller?.runJavascriptReturningResult(
    //   //     "checkPayStatus('');");
    // }
  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    // controller?.runJavascriptReturningResult( "window.localStorage.setItem('h5__token','');");
    //清空H5 token
    if(Platform.isIOS){
      //iOS有效 安卓无效
      controller?.runJavascriptReturningResult( "window.localStorage.clear();");
    }
    if(Platform.isAndroid){
      //安卓有效 iOS无效
      controller?.clearCache();
    }
  }
}

// 判断是否是app
class IsAppChannel extends BaseScriptChannel {
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('IsApp', (message) async {
    });
  }
}
// 获取H5Token
class GetH5Token extends BaseScriptChannel {
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('GetH5Token', (message) async {

    });
  }
}

// 去外部浏览器支付
class ToBrowserPayChannel extends BaseScriptChannel {
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('ToBrowser', (message) async {
      final url = message['param']['url'];
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    });
  }
}

// 通过外部浏览器打开文件预览
class FilePreviewChannel extends BaseScriptChannel {
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('FilePreview', (message) async {
      final fileUrl = message['param']['fileUrl'];
      toFilePreviewPage(filePath: fileUrl);

      // 尝试打开文件预览,这里是直接跳转外部浏览器下载
      // await launchUrl(Uri.parse(fileUrl), mode: LaunchMode.externalApplication);
    });
  }
}


// 跳转拨号界面
class ToTelPhone extends BaseScriptChannel {
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('ToTelPhone', (message) async {
      final phoneNum = message['param']['phoneNum'];
      final String url = 'tel:$phoneNum';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      }
    });
  }
}
//选择图片
class SelectImageChannel extends BaseScriptChannel {
  final ValueChanged? voidCallback;

  SelectImageChannel({this.voidCallback});

  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('SelectImage', (message) {
      voidCallback?.call(message);
    });
  }
}
//返回
class BackChannel extends BaseScriptChannel {
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('Back', (message) async {
      RouterUtil.instance.pop();
    });
  }
}
// //去登录
// class LoginChannel extends BaseScriptChannel {
//   @override
//   JavascriptChannel createJavascriptChannel() {
//     return createChannel('Login', (message) async {
//        RouterUtil.instance.build(CommonRouterNames.loginPage).navigate();
//     });
//   }
// }
class LoginChannel extends BaseScriptChannel {
  final VoidCallback? voidCallback;
  LoginChannel({this.voidCallback});
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('Login', (message) async {
      await RouterUtil.instance.build(CommonRouterNames.loginPage).navigate();
      voidCallback?.call();
    });
  }
}
// 进入我的订单
class EnterOrderListChannel extends BaseScriptChannel {
  final VoidCallback? voidCallback;
  EnterOrderListChannel({this.voidCallback});
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('EnterOrderList', (message) async {
      voidCallback?.call();
    });
  }
}
// 离开我的订单
class LeaveOrderListChannel extends BaseScriptChannel {
  final VoidCallback? voidCallback;
  LeaveOrderListChannel({this.voidCallback});
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('LeaveOrderList', (message) async {
      voidCallback?.call();
    });
  }
}
//返回
class SetTitleChannel extends BaseScriptChannel {
  final void Function(String)? titleCallback;
  SetTitleChannel({this.titleCallback});
  @override
  JavascriptChannel createJavascriptChannel() {
    return createChannel('SetTitle', (message) async {
      print("message =$message");
      final title = message['param']['title'];
      titleCallback?.call(title);
    });
  }
}
