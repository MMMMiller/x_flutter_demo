///文件名:    bc_avatar_image
///创建时间:  2022/9/22 on 10:14
///描述:
///
///@author   xueml

import 'dart:typed_data';
import 'dart:io' as io;
import 'package:common_lib/index.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

class BcAvatarImage extends BaseStatelessWidget {
  final String? network;
  final String? asset;
  final Uint8List? memory;
  final io.File? file;
  final double? size;
  final BorderRadius? borderRadius;
  final Color? color;
  final String error;

  BcAvatarImage({
    super.key,
    this.network,
    this.asset,
    this.memory,
    this.file,
    this.size,
    this.borderRadius,
    this.color,
    this.error = BcCommonImage.icAvatarDefaultGray,
  });

  @override
  Widget build(BuildContext context) {
    if ((network ?? '').isEmpty) {
      return CommonImage(
        asset: error,
        circle: true,
        width: size,
        height: size,
      );
    }
    return CommonImage(
      file: file,
      network: network,
      memory: memory,
      circle: true,
      width: size,
      height: size,
      errorWidget: CommonImage(
        asset: error,
        circle: true,
        width: size,
        height: size,
      ),
      loadingWidget: CommonContainer(
        color: ColorsConfig.f8f9f8,
        width: size,
        height: size,
      ),
    );
  }
}
