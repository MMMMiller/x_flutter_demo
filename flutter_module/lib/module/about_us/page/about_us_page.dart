
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/common/util/colors_config.dart';
import 'package:flutter_module/common/util/native_messenger.dart';
import 'package:flutter_module/generated/assets/yxd_assets.dart';
import 'package:flutter_module/module/about_us/widget/download_app_dialog.dart';
import 'package:flutter_module/module/about_us/widget/row_item.dart';
import 'package:flutter_module/module/base/yjy_page.dart';
import 'package:flutter_module/module/user/domain/bloc/user_info/user_center_bloc.dart';
import 'package:flutter_module/module/user/domain/model/agreement_info_entity.dart';
import 'package:todo_flutter/todo_flutter.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends YjyPage<AboutUsPage> {
  final DataChangeBloc<String> _appVersionBloc = DataChangeBloc('');

  @override
  String? get pageName => '关于驿小店';

  @override
  Widget yjyBuild(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Center(
            child: CommonImage(
              asset: YxdAssets.iconLogo,
              width: 65,
              height: 65,
            ),
          ),
        ),
        SizedBox(height: 24,),
        CommonText(
          '驿小店',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        SizedBox(height: 12,),
        DataChangeWidget(
          bloc: _appVersionBloc,
          child: (context,String? state) {
            var version = state;
            return CommonText(
              'Version' + (version != null ? version : ''),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: ColorsConfig.ff666666,
            );
          },
        ),
        DataChangeWidget(
            bloc: UserCenterBloc.instance.agreementBloc,
            child: (context, AgreementInfoEntity? state) {
              return renderRowItem(
                title: '检查更新',
                click: () {
                  // toWebPage(
                  //   link: state.data.disclaimer?.agreementUrl,
                  //   title: '风险与免责声明',
                  // // );
                  // webModuleProvider.toBCWebPage(
                  //   link: state.data.disclaimer?.agreementUrl,
                  //   title: '风险与免责声明',
                  // );
                },
              );
            }),
        renderRowItem(
          title: '下载驿小店App',
          click: () {
            showDownloadAppDialog();
          },
        ),
        renderRowItem(
          title: '驿小店web端',
          showBorder: false,
          desc: 'https://ant.yshoufa.com/',
          rightIcon: GestureDetector(
              onTap: () async {
                // appUpdateBloc.checkUpdateAndLoading();
                await Clipboard.setData(
                  ClipboardData(text: 'imContent?.text?.content ?? ' ''),
                );
                showToast('复制成功');
                print('o bject');
              },
              child: Icon(
                Icons.copy,
                color: ColorsConfig.ff666666,
                size: 16,
              )),
          click: () {
            // appUpdateBloc.checkUpdateAndLoading();
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentVersion();
  }

  getCurrentVersion() async {
    String version = await NativeMessenger.shared().getAppVersion();
    _appVersionBloc.changeData(version);
  }

  void showDownloadAppDialog() {

    showDialog(
      barrierDismissible: true,
        context: context,
        builder: (_) {
          return DownloadAppDialog(
            onClose: () {
              Navigator.pop(context);
            },
          );
        });
  }
}
