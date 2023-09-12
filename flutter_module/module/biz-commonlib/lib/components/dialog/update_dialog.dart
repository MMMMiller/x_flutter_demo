///文件名:    show_private_tip_dialog
///创建时间:  2022/10/19 on 15:15
///描述:
///
///@author   xueml

import 'package:bc_upgrade/bc_upgrade.dart';
import 'package:bc_upgrade/update_model.dart';
import 'package:common_lib/components/dialog/bc_color_tip_dialog.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'package:common_lib/service/update/model/app_update_entity.dart';
import 'package:flutter/material.dart';
import 'package:common_lib/index.dart';

class UpdateDialog extends StatefulWidget {
  final AppUpdateEntity appUpdateEntity;
  final Function? onCancel;

  const UpdateDialog({
    required this.appUpdateEntity,
    this.onCancel,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => UpdateDialogState();
}

class UpdateDialogState extends BaseState<UpdateDialog> {
  AppUpdateEntity get appUpdateEntity => widget.appUpdateEntity;

  bool get forcedUpgrade => appUpdateEntity.updateType == 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: BcColorTipDialog(
        content: _renderContent(),
        onCancel: forcedUpgrade ? null : (){
          widget.onCancel?.call();
          RouterUtil.instance.pop();
        },
        onConfirm: () {
          if (!forcedUpgrade) {
            widget.onCancel?.call();
            RouterUtil.instance.pop();
          }
          _update();
        },
      ),
      onWillPop: () => Future.value(false),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizeBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: CommonText(
              '版本更新',
              color: ColorsConfig.ff333333,
              fontSize: 18,
              bold: true,
            ),
          ),
        ),
        sizeBox(height: 36),
        Expanded(
          child: SingleChildScrollView(
            child: CommonText(
              appUpdateEntity.updateContent ?? '',
              color: ColorsConfig.ff333333,
              height: 1.8,
              bold: true,
            ),
          ),
        )
      ],
    );
  }

  void _update() {
    final UpdateModel model = UpdateModel(
      appUpdateEntity.downloadUrl ?? '',
      '天相财富.apk',
      'ic_launcher',
      appUpdateEntity.updateContent ?? '',
      showiOSDialog:false,
      iOSUrl: appUpdateEntity.downloadUrl ?? 'https://apps.apple.com/cn/app/%E5%A4%A9%E7%9B%B8%E8%B4%A2%E5%AF%8C/id1570190904',
    );
    BcUpgrade.update(model).then(print);
  }
}
