import 'package:common_lib/components/dialog/update_dialog.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/update/bloc/app_update_bloc.dart';
import 'package:common_lib/service/update/model/app_update_entity.dart';
export 'package:common_lib/service/update/model/app_update_entity.dart';
import 'package:flutter/material.dart';

///文件名:    app_update_mixin
///创建时间:  2022/10/26 on 16:56
///描述:
///
///@author   xueml

mixin AppUpdateMixin<T extends StatefulWidget> on BaseBlocState<T> {
  @override
  void sendEventToView(ViewEvent event) {
    super.sendEventToView(event);
    if (event is AppUpdateViewEvent) {
      appUpdate(event.appUpdateEntity);
    }
  }

   void appUpdate(AppUpdateEntity info){
    if(isShowDialog) {
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: info.updateType != 0,
      builder: (_) {
        return UpdateDialog(
          appUpdateEntity: info,
          onCancel:(){
            isShowDialog = false;
          },
        );
      },
    );
    isShowDialog = true;
  }

  @override
  void initState() {
    super.initState();
    injectBloc(AppUpdateBloc()..setView(this));
  }

  bool isShowDialog = false;
  AppUpdateBloc get appUpdateBloc => getBc<AppUpdateBloc>();
}
