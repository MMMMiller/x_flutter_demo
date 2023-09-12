import 'package:flutter/material.dart';
import 'package:ui_components/base/ui_adapter.dart';

mixin UIWidget implements UIAdapter {
  ///所有方向边距
  EdgeInsets all(double value) {
    return EdgeInsets.all(sWidth(value));
  }

  ///水平、竖直方向边距
  EdgeInsets symmetric(double vertical, double horizontal) {
    return EdgeInsets.symmetric(
      vertical: sWidth(vertical),
      horizontal: sWidth(horizontal),
    );
  }

  ///指定方向边距
  EdgeInsets only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.only(
        left: sWidth(left),
        top: sWidth(top),
        right: sWidth(right),
        bottom: sWidth(bottom));
  }

  ///间距
  SizedBox sizedBox({double width = 0, double height = 0}) {
    return SizedBox(width: sWidth(width), height: sWidth(height));
  }
}
