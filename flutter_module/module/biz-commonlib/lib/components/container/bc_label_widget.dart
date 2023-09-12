import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

/// createTime: 2022/9/7 on 11:33
/// desc:
///
/// @author azhon
class BcLabelWidget extends BaseStatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  BcLabelWidget({
    super.key,
    this.text = '',
    this.textColor = ColorsConfig.ff1966ff,
    this.backgroundColor = ColorsConfig.ffe8f0ff,
    this.borderColor = ColorsConfig.ffd1e0ff,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: symmetric(1, 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(sRadius(2)),
        border: Border.all(color: borderColor, width: sWidth(1)),
      ),
      child: CommonText(
        text,
        color: textColor,
        fontSize: 10,
        strutStyle: const StrutStyle(
          forceStrutHeight: true,
        ),
      ),
    );
  }
}
