///文件名:    default_search_empty_widget
///创建时间:  2022/9/24 on 16:50
///描述:
///
///@author   xueml

import 'package:common_lib/index.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

class DefaultSearchEmptyWidget extends BaseStatelessWidget {
  DefaultSearchEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonImage(
          asset: BcCommonImage.icDefaultSearchEmpty,
          width: 160,
          height: 160,
        ),
        SizedBox(height: sHeight(10)),
        CommonText(
          '暂无数据',
          fontSize: 14,
          color: ColorsConfig.ff969799,
        ),
      ],
    );
  }
}
