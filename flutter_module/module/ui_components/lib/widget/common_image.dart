import 'dart:io' as io;
import 'dart:typed_data';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/base/ui_adapter.dart';
import 'package:ui_components/base/base_stateless_widget.dart';

class CommonImage extends BaseStatelessWidget with UIAdapter {
  final String? network;
  final String? asset;
  final Uint8List? memory;
  final io.File? file;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final bool circle;
  final Widget? errorWidget;
  final Widget? loadingWidget;

  CommonImage({
    this.network,
    this.asset,
    this.memory,
    this.file,
    Key? key,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.border,
    this.errorWidget,
    this.loadingWidget,
    this.fit = BoxFit.cover,
    this.circle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    double? w = width == null ? null : sWidth(width!);
    double? h = height == null ? null : sWidth(height!);
    BoxShape shape = circle ? BoxShape.circle : BoxShape.rectangle;
    if (network != null) {
      widget = ExtendedImage.network(network!,
          width: w,
          height: h,
          shape: shape,
          fit: fit,
          color: color,
          gaplessPlayback: true,
          border: border,
          borderRadius: borderRadius,
          loadStateChanged: (state) => loadStateChanged(state));
    }
    if (asset != null) {
      widget = ExtendedImage.asset(asset!,
          width: w,
          height: h,
          shape: shape,
          fit: fit,
          color: color,
          border: border,
          gaplessPlayback: true,
          borderRadius: borderRadius,
          loadStateChanged: (state) => loadStateChanged(state));
    }
    if (memory != null) {
      widget = ExtendedImage.memory(memory!,
          width: w,
          height: h,
          shape: shape,
          fit: fit,
          gaplessPlayback: true,
          color: color,
          border: border,
          borderRadius: borderRadius,
          loadStateChanged: (state) => loadStateChanged(state));
    }
    if (file != null) {
      widget = ExtendedImage.memory(file!.readAsBytesSync(),
          width: w,
          height: h,
          shape: shape,
          fit: fit,
          gaplessPlayback: true,
          color: color,
          border: border,
          borderRadius: borderRadius,
          loadStateChanged: (state) => loadStateChanged(state));
    }
    return widget ?? errorWidget ??  sizedBox(width: width ?? 0, height: height ?? 0);
  }

  Widget? loadStateChanged(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return loadingWidget ??
            sizedBox(width: width ?? 0, height: height ?? 0);
      case LoadState.failed:
        return errorWidget ?? sizedBox(width: width ?? 0, height: height ?? 0);
      default:
        return null;
    }
  }
}
