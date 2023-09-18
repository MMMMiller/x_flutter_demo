import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_flutter.dart';

class ColorUtil {
  /// 动态选择深浅色
  static Color dynamicColor({
    required BuildContext context,
    required Color light,
    required Color dark,
  }) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? dark : light;
  }


  ///16进制颜色转换
  static Color fromHex(String? hexColor) {
    if (ObjectUtil.isEmpty(hexColor)) {
      return Colors.transparent;
    }
    hexColor = hexColor!.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
