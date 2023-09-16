/// createTime: 2023/9/16 on 18:27
/// desc:
///
/// @author xueml

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/common/widgets/yjy_page.dart';
import 'package:flutter_module/config/util/colors_config.dart';
import 'package:flutter_module/src/user/about_us/widget/download_app_dialog.dart';
import 'package:flutter_module/src/user/about_us/widget/row_item.dart';
import 'package:flutter_thrio/flutter_thrio.dart';
import 'package:todo_flutter/todo_flutter.dart';

class AboutUsPage extends NavigatorStatefulPage {
  const AboutUsPage({
    super.key,
    required super.moduleContext,
    required super.settings,
  });

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends BasePage<AboutUsPage>
    with NavigatorPageLifecycleMixin {
  final DataChangeBloc<String> _appVersionBloc = DataChangeBloc('');

  @override
  String? get pageName => '关于驿小店';

  @override
  Widget baseBuild(BuildContext context) => Column(
      children: [
        const SizedBox(
          height: 160,
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: const Center(
            child: Icon(
              Icons.abc,
              size: 100,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const CommonText(
          '驿小店',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        const SizedBox(
          height: 12,
        ),
        DataChangeWidget(
          bloc: _appVersionBloc,
          child: (context, String? state) {
            final version = state;
            return CommonText(
              'Version ${version != null ? version : ''}',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: ColorsConfig.ff666666,
            );
          },
        ),
        renderRowItem(
          title: '检查更新',
          click: () {
            showDownloadAppDialog();
          },
        ),
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
                  const ClipboardData(text: 'imContent?.text?.content ?? ' ''),
                );
                showToast('复制成功');
                print('o bject');
              },
              child: const Icon(
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

  @override
  void initState() {
    super.initState();
    getCurrentVersion();
  }

  @override
  void didAppear(final RouteSettings settings) {
    super.didAppear(settings);
    print('哈哈哈哈\n about_us_page,Appear');
  }

  @override
  void didDisappear(final RouteSettings settings) {
    super.didDisappear(settings);
    print('哈哈哈哈\n about_us_page,Disappear');
  }

  getCurrentVersion() async {
    // String? version = await NativeMessenger.shared().getAppVersion();
    // _appVersionBloc.changeData(version);
  }

  void showDownloadAppDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (_) => DownloadAppDialog(
            onClose: () {
              Navigator.pop(context);
            },
          ));
  }
}
