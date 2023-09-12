///文件名:    souce_tag_widget
///创建时间:  2022/9/23 on 17:36
///描述:
///
///@author   xueml

import 'package:common_lib/index.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

class CustomerSourceModel {
  static const qw = 1000;
  static const call = 2000;
  static const app = 3000;
  static const productRecord = 4000;
  static const bizRecord = 5000;
  static const other = 6000;
}

class SourceTagWidget extends BaseStatelessWidget {
  final int sourceTag;

  SourceTagWidget(this.sourceTag, {super.key});

  @override
  Widget build(BuildContext context) {
    if (sourceTag == CustomerSourceModel.call) {
      return _renderIconItem(CommonIcon.icMobile, context);
    }
    if (sourceTag == CustomerSourceModel.app) {
      return _renderIconItem(CommonIcon.icMobile, context);
    }
    if (sourceTag == CustomerSourceModel.qw) {
      return _renderImageItem(BcCommonImage.icWechat, context);
    }
    return _renderIconItem(CommonIcon.icMobile, context);
  }

  Icon _renderIconItem(IconData data, BuildContext context) {
    return Icon(
      CommonIcon.icMobile,
      size: 16,
      color: ThemeUtil.getDesColor(context),
    );
  }

  Widget _renderImageItem(String imagePath, BuildContext context) {
    return CommonImage(
      asset: imagePath,
      width: 16,
      height: 16,
    );
  }
}
