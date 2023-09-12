import 'package:flutter/material.dart';
import 'package:ui_components/base/base_stateless_widget.dart';

class CommonContainer extends BaseStatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final Border? border;

  CommonContainer(
      {Key? key,
      this.height,
      this.child,
      this.padding,
      this.margin,
      this.color,
      this.border,
      this.borderRadius,
      this.boxShadow,
      this.gradient,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? null : sHeight(width!),
      height: height == null ? null : sHeight(height!),
      margin: margin,
      padding: padding,
      child: child,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: borderRadius,
        border: border,
        gradient: gradient,
        boxShadow: boxShadow,
      ),
    );
  }
}
