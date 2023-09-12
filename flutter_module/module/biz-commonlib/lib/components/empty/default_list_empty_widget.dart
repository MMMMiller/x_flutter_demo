import 'package:common_lib/index.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

class DefaultListEmptyWidget extends BaseStatelessWidget {
  final Widget? bottomWidget;
  final Function? refresh;

  DefaultListEmptyWidget({this.bottomWidget, this.refresh, super.key});

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
        const SizedBox(height: 16),
        CommonClickWidget(
          singleClick: () {
            refresh?.call();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.refresh,
                size: 24,
                color: ColorsConfig.ff999999,
              ),
              sizedBox(width: 16),
              CommonText(
                '重新加载',
                height: 1.2,
                color: ColorsConfig.ff999999,
              ),
            ],
          ),
        )
      ],
    );
  }
}
