import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

///文件名:    bc_app_bar
///创建时间:  2022/9/1 on 18:30
///描述:
///
///@author   xueml

class BcAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? rightText;
  final VoidCallback? onTap;
  final VoidCallback? onBackTap;
  final Widget? centerWidget;
  final Widget? leading;
  final Color? rightColor;
  final Widget? rightWidget;
  final double? elevation;

  BcAppBar({
    required this.title,
    super.key,
    this.rightText,
    this.onTap,
    this.centerWidget,
    this.rightColor,
    this.rightWidget,
    this.leading,
    this.elevation,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = ModalRoute.of(context)?.canPop ?? false;
    return AppBar(
      elevation: elevation ?? 0.5,
      titleSpacing: canPop ? 0 : sWidth(12),
      centerTitle: true,
      actions: rightWidget != null
          ? [
              Padding(
                padding: EdgeInsets.only(right: sWidth(16)),
                child: Center(
                  child: rightWidget,
                ),
              )
            ]
          : [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTap,
                child: Align(
                  child: Padding(
                    padding: EdgeInsets.only(right: sWidth(16)),
                    child: CommonText(
                      rightText ?? '',
                      color: rightColor ?? ColorsConfig.ff393c42,
                    ),
                  ),
                ),
              )
            ],
      leading: canPop
          ? leading ??
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: sWidth(16),
                ),
                onPressed: onBackTap ?? () {
                  Navigator.pop(context);
                },
              )
          : null,
      title: centerWidget ??
          CommonText(
            title,
            fontSize: 16,
          ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(sWidth(52));
  }
}
