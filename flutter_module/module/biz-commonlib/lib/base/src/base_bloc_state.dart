import 'package:common_lib/base/src/base_biz_ui_mixin.dart';
import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

abstract class BaseBlocState<T extends StatefulWidget> extends BaseUIState<T>
    with XBaseState<T>, ViewToBloc {
  static ViewEventObserver viewEventObserver = ViewEventObserver();

  bool _isShowLoadingDialog = false;

  @override
  void showLoadingDialog({String? msg}) {
    _isShowLoadingDialog = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CommonLoadingDialog(
            msg: msg ?? '加载中...',
          );
        }).then((value) => _isShowLoadingDialog = false);
  }

  @override
  bool isShowLoading() {
    return _isShowLoadingDialog;
  }

  @override
  void toast(String s) {
    Toast.showToast(s);
  }

  @override
  void dismissDialog() {
    _isShowLoadingDialog = false;
    Navigator.of(context).pop();
  }

  @override
  void sendEventToView(ViewEvent event) {
    viewEventObserver.hookViewEvent(event, this);
  }

  @override
  void onResume() {
    super.onResume();
  }
}

abstract class BaseState<T extends StatefulWidget> extends BaseBlocState<T>
    with UIAdapter, BaseBizUiMixin {}
