import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

///文件名:    base_biz_ui_adapter
///创建时间:  2022/9/1 on 14:58
///描述:
///
///@author   xueml

mixin BaseBizUiMixin on UIAdapter, UIWidget {

  Widget paddingV16H16({required Widget child}) {
    return Padding(
      padding: symmetric(16, 16),
      child: child,
    );
  }
  Widget paddingV16H30({required Widget child}) {
    return Padding(
      padding: symmetric(16, 30),
      child: child,
    );
  }

  Widget sizeBoxW16() {
    return SizedBox(width: sWidth(16));
  }

  Widget sizeBoxW24() {
    return SizedBox(width: sWidth(24));
  }

  Widget sizeBoxH24() {
    return SizedBox(height: sHeight(24));
  }

  Widget sizeBoxW12() {
    return SizedBox(width: sWidth(24));
  }

  Widget sizeBoxH12() {
    return SizedBox(height: sHeight(12));
  }

  Widget sizeBoxH16() {
    return SizedBox(height: sHeight(16));
  }

  Widget sizeBoxW32() {
    return SizedBox(width: sWidth(32));
  }

  Widget sizeBoxH32() {
    return SizedBox(height: sHeight(32));
  }

  Widget sizeBox({double width = 0, double height = 0}) {
    return SizedBox(width: sWidth(width), height: sHeight(height));
  }
}
