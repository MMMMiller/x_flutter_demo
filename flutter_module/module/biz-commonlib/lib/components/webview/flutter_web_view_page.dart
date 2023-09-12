import 'dart:io';

import 'package:common_lib/components/app_bar/bc_app_bar.dart';
import 'package:common_lib/components/webview/bc_web_view.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as wl;


Set<JavascriptChannel> injectChannel = {};

/// 从业务模块注入通用业务channel（需要在业务模块初始化时注入）
void injectBusinessChannel(Set<JavascriptChannel> businessChannel) {
  injectChannel.addAll(businessChannel);
}

class FlutterWebViewPage extends StatefulWidget {

  final String link;
  final String title;


  const FlutterWebViewPage({
    required this.link,
    required this.title,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return WebPageState();
  }
}

class WebPageState extends BcPage<FlutterWebViewPage> {
  WebViewController? controller;
  int orderListShowState = 0;
  String? webTitle ;

  final GlobalKey<BcWebViewState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      wl.WebView.platform = wl.SurfaceAndroidWebView();
    }
  }

  WebViewController? get webViewController => _key.currentState?.controller;

  @override
  Widget bcBuild(BuildContext context) {
    return WillPopScope(
      child: BcWebView(
        key: _key,
        link: widget.link,
        javascriptChannels: injectChannel,
        orderListStateCallback:(int state){
          orderListShowState = state;
          },
          getTitle:(String title){
            setState(() {
              webTitle = title;
            });
          },
      ),
      onWillPop: () async {
        if (webViewController == null) {
          return Future.value(true);
        }
        if (await webViewController!.canGoBack() && orderListShowState != 1) {
          await webViewController!.goBack();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
    );
  }

  @override
  PreferredSizeWidget? get bcAppBar => BcAppBar(
    title: webTitle ?? widget.title ?? '',
    onBackTap: () async {
      await _back();
    },
  );

  Future<void> _back() async {
    if (webViewController == null) {
      RouterUtil.instance.pop();
      return;
    }
    if (await webViewController!.canGoBack()
        && orderListShowState != 1) {
      //H5我的订单 不能在H5中返回
      await webViewController!.goBack();
    } else {
      RouterUtil.instance.pop();
    }
  }
}
