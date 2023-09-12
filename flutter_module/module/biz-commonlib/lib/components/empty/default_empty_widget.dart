import 'package:common_lib/index.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

class DefaultEmptyWidget extends BaseStatelessWidget {
  final Widget? bottomWidget;

  DefaultEmptyWidget({this.bottomWidget, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 50),
        CommonImage(
            asset: BcCommonImage.icNotContent,
            width: sWidth(160),
            height: sWidth(160)),
        const SizedBox(height: 16),
        CommonText('暂无相关数据', color: ColorsConfig.ff999999, fontSize: 14),
      ],
    );
  }
}
