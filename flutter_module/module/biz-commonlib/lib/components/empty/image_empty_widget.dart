import 'package:common_lib/components/app_bar/bc_app_bar.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

/// createTime: 2022/10/24 on 17:17
/// desc:
///
/// @author azhon
class ImageEmptyWidget extends BaseStatelessWidget {
  final EmptyType type;
  final Color color;
  final double? width;
  final double? height;
  final double? radius;
  ImageEmptyWidget({
    this.width,
    this.height,
    this.radius,
    super.key,
    this.color = ColorsConfig.fff5f8ff,
    this.type = EmptyType.emptyImage,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius:  BorderRadius.all(Radius.circular(sRadius(radius ?? 16))),
      ),
      child: Center(
        child: CommonImage(
          asset: type.value,
          width: width ?? 32,
          height: height ?? 32,
        ),
      ),
    );
  }
}
