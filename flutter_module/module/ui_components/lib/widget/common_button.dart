import 'package:flutter/material.dart';
import 'package:ui_components/base/base_stateless_widget.dart';
import 'package:ui_components/widget/common_text.dart';

class CommonButton extends BaseStatelessWidget {
  final String text;
  final double radius;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Color? textColor;
  final Color borderColor;
  final bool disable;
  final double borderWidth;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;

  CommonButton(
    this.text, {
    Key? key,
    this.color,
    this.width,
    this.height,
    this.radius = 0,
    this.fontSize,
    this.fontWeight,
    this.margin,
    this.padding,
    this.onPressed,
    this.onLongPress,
    this.gradient,
    this.borderWidth = 1,
    this.disable = false,
    this.borderColor = Colors.transparent,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final disabledColor = color == null
        ? Theme.of(context).primaryColor.withOpacity(0.3)
        : color!.withOpacity(0.3);
    return IgnorePointer(
      ignoring: disable,
      child: Container(
        width: width == null ? null : sWidth(width!),
        height: height == null
            ? (padding == null ? sWidth(45) : null)
            : sWidth(height!),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          gradient: gradient,
        ),
        child: TextButton(
          onPressed: () => onPressed?.call(),
          onLongPress: () => onLongPress?.call(),
          style: disable
              ? TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: disabledColor,
                  side: BorderSide(
                      color: borderColor, width: sWidth(borderWidth)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sRadius(radius)),
                  ),
                  minimumSize: Size.zero,
                  padding: padding ?? EdgeInsets.zero,
                )
              : TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor:
                      gradient == null ? (color ?? primaryColor) : null,
                  side: BorderSide(
                      color: borderColor, width: sWidth(borderWidth)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(sRadius(radius)),
                  ),
                  minimumSize: Size.zero,
                  padding: padding ?? EdgeInsets.zero,
                ),
          child: Center(
            child: CommonText(
              text,
              color: textColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
