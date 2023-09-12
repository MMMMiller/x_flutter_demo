///文件名:    bc_check_box
///创建时间:  2022/9/15 on 16:31
///描述:
///
///@author   xueml

import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

class BcCheckBox extends BaseStatelessWidget {
  final Function(bool?)? onChange;
  final bool isRound;
  final bool isChecked;
  final EdgeInsets? inset;
  final double? radius;
  final Color? themeColor;

  BcCheckBox(
      {this.onChange,
      this.isChecked = true,
      this.themeColor,
      this.inset,
      this.radius = 0,
      this.isRound = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCheckBox(
      onTap: (selected) {
        onChange?.call(selected);
      },
      isRound: isRound,
      isChecked: isChecked,
      size: sWidth(16),
      checkedWidget: const Icon(
        CommonIcon.icCheckbox,
        color: Colors.white,
        size: 12,
      ),
      inset: inset,
      radius: radius,
      checkedColor:
          themeColor != null ? themeColor : ThemeUtil.getPrimaryColor(context),
      uncheckedColor: Colors.white,
      borderColor:
          themeColor != null ? themeColor : ThemeUtil.getPrimaryColor(context),
      unSelectBorderColor: ColorsConfig.ffdcdfe6,
    );
  }
}
