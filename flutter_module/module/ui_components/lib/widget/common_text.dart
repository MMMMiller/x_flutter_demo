import 'package:flutter/material.dart';
import 'package:ui_components/base/ui_adapter.dart';
import 'package:ui_components/base/base_stateless_widget.dart';

class CommonText extends BaseStatelessWidget with UIAdapter {
  final String text;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? height;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontStyle fontStyle;
  final TextAlign? textAlign;
  final bool bold;
  final StrutStyle? strutStyle;
  final TextDecorationStyle? decorationStyle;

  CommonText(
    this.text, {
    Key? key,
    this.fontSize,
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.height,
    this.letterSpacing,
    this.maxLines,
    this.decoration,
    this.decorationStyle,
    this.overflow,
    this.textAlign,
    this.bold = false,
    this.strutStyle,
    this.fontStyle = FontStyle.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: sFontSize(fontSize ?? 14),
        fontFamily: fontFamily,
        fontWeight: bold ? FontWeight.w600 : fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
        decorationStyle: decorationStyle,
        fontStyle: fontStyle,
      ),
      strutStyle: strutStyle,
    );
  }
}
