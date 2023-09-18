import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/common/util/colors_config.dart';
import 'package:flutter_module/common/util/native_messenger.dart';
import 'package:flutter_module/generated/assets/yxd_assets.dart';
import 'package:flutter_module/module/about_us/domain/bloc/update_bloc.dart';
import 'package:flutter_module/module/about_us/widget/download_app_dialog.dart';
import 'package:flutter_module/module/about_us/widget/row_item.dart';
import 'package:flutter_module/module/base/yjy_page.dart';
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

  UpdateBloc get _updateBloc => getBloc<UpdateBloc>();

  @override
  void initState() {
    super.initState();
    addBloc(UpdateBloc()..setState(this));
    getCurrentVersion();
  }

  @override
  Widget yjyBuild(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 160),
        Container(
            width: double.infinity,
            color: Colors.white,
            child: Center(
                child: CommonImage(
                    asset: YxdAssets.iconLogo, width: 65, height: 65))),
        SizedBox(height: 24),
        CommonText('驿小店',
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        SizedBox(height: 12),
        DataChangeWidget(
            bloc: _appVersionBloc,
            child: (context, String? state) {
              var version = state;
              return CommonText('Version ' + (version != null ? version : ''),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: ColorsConfig.ff666666);
            }),
        renderRowItem(
            title: '检查更新',
            click: () {
              // NativeMessenger.shared().checkUpgrade();
              _updateBloc.versionInfoRequest();
            }),
        renderRowItem(
            title: '下载驿小店App',
            click: () {
              showDownloadAppDialog();
            }),
        renderRowItem(
            title: '驿小店web端',
            showBorder: false,
            desc: 'https://ant.yshoufa.com/',
            rightIcon: GestureDetector(
                onTap: () async {
                  await Clipboard.setData(
                    ClipboardData(text: 'https://ant.yshoufa.com/'),
                  );
                  showToast('链接已复制');
                },
                child: Icon(
                  Icons.copy,
                  color: ColorsConfig.ff666666,
                  size: 16,
                )))
      ],
    );
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
          return DownloadAppDialog(onClose: () {
            Navigator.pop(context);
          });
        });
  }
}
