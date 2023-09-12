import 'package:common_lib/components/app_bar/bc_app_bar.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

/// createTime: 2022/10/24 on 17:17
/// desc:
///
/// @author azhon
class NewEmptyWidget extends BaseStatelessWidget {
  final bool showGoHome;
  final String tip;
  final String text;
  final EmptyType type;
  final VoidCallback? onPressed;
  final bool showNavi;

  NewEmptyWidget({
    this.showGoHome = false,
    this.tip = '暂无权限',
    this.showNavi = true,
    this.text = '联系客服',
    this.type = EmptyType.error,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!showNavi) {
      return _buildEmpty();
    }
    return Scaffold(
      appBar: BcAppBar(
        title: '',
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: _buildEmpty(),
    );
  }

  Widget _buildEmpty() {
    return Column(
      children: [
        CommonImage(
          asset: type.value,
          width: 160,
          height: 160,
        ),
        sizedBox(height: 16),
        CommonText(
          tip,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorsConfig.ff969799,
        ),
        sizedBox(height: 48),
        CommonButton(
          text,
          fontSize: 16,
          height: sWidth(48),
          radius: sRadius(4),
          margin: symmetric(0, 16),
          fontWeight: FontWeight.w500,
          color: ColorsConfig.ffff5e42,
          onPressed: onPressed,
        ),
        Visibility(
          visible: showGoHome,
          child: CommonButton(
            '返回首页',
            fontSize: 16,
            height: sWidth(48),
            radius: sRadius(4),
            margin: only(top: 16, left: 16, right: 16),
            fontWeight: FontWeight.w500,
            color: ColorsConfig.ffff5e42,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

enum EmptyType {
  notFound(BcCommonImage.ic404Empty),
  avatarDefault(BcCommonImage.icAvatarDefaultGray),
  logout(BcCommonImage.icLogoutEmpty),
  error(BcCommonImage.icErrorEmpty),
  notContent(BcCommonImage.icNotContent),
  emptyImage(BcCommonImage.icEmptyImage),
  emptySound(BcCommonImage.icEmptySound),
  emptyUserGroup(BcCommonImage.icEmptyUserGroup),
  emptyVideo(BcCommonImage.icEmptyVideo),
  emptyVideoCamera(BcCommonImage.icEmptyVideoCamera),
  emptyDollar(BcCommonImage.icEmptyDollar),
  emptyDollarHor(BcCommonImage.icEmptyDollarHor),
  ;

  final String value;

  const EmptyType(this.value);
}
