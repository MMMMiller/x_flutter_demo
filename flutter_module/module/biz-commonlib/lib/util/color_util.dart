import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

/// createTime: 2022/10/13 on 15:58
/// desc:
///
/// @author azhon
class ColorUtil {
  ///16进制颜色转换
  static Color fromHex(String? hexColor) {
    if (isEmpty(hexColor)) {
      return Colors.transparent;
    }
    hexColor = hexColor!.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
