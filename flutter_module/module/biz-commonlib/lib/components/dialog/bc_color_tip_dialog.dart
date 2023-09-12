///文件名:    show_private_tip_dialog
///创建时间:  2022/10/19 on 15:15
///描述:
///
///@author   xueml

import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';
import 'package:common_lib/index.dart';

class BcColorTipDialog extends StatefulWidget {
  final Widget content;
  final Function? onConfirm;
  final Function? onCancel;
  final double? maxHeight;

  const BcColorTipDialog({
    required this.content,
    super.key,
    this.onConfirm,
    this.onCancel,
    this.maxHeight,
  });

  @override
  State<StatefulWidget> createState() => BcColorTipDialogState();
}

class BcColorTipDialogState extends BaseState<BcColorTipDialog> {
  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(
      sRadius(16),
    );
    return CommonContainer(
      color: Colors.transparent,
      margin: symmetric(0, 33),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      sizeBox(height: 26),
                      Stack(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              minHeight: sHeight(200),
                              maxHeight: sHeight(widget.maxHeight ?? 200),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: radius,
                                topRight: radius,
                              ),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorsConfig.ffcec6,
                                  ColorsConfig.white,
                                  ColorsConfig.white,
                                  ColorsConfig.white,
                                  ColorsConfig.white,
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: sWidth(29),
                            top: sWidth(21),
                            child: CommonImage(
                              asset: BcCommonImage.icPrivateTagOne,
                              width: sWidth(40),
                              height: sHeight(22),
                            ),
                          ),
                          Positioned(
                            right: sWidth(32),
                            top: sWidth(35),
                            child: CommonImage(
                              asset: BcCommonImage.icPrivateTagTwo,
                              width: sWidth(131),
                              height: sHeight(53),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Padding(
                              padding: symmetric(0, 33),
                              child: widget.content,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    right: sWidth(25),
                    top: 0,
                    child: CommonImage(
                      asset: BcCommonImage.icPrivateTagThere,
                      width: sWidth(58),
                      height: sHeight(58),
                    ),
                  ),
                ],
              ),
              _renderBottom(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _renderBottom() {
    final radius = Radius.circular(
      sRadius(16),
    );
    return CommonContainer(
      width: double.infinity,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 0.2,
          spreadRadius: 0.5,
        ),
      ],
      borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius),
      child: Column(
        children: [
          sizeBox(height: 14),
          CommonButton(
            '同意',
            width: 180,
            color: ColorsConfig.primaryColor,
            radius: sRadius(18),
            height: 37,
            onPressed: () {
              widget.onConfirm?.call();
            },
          ),
          Visibility(
            visible: widget.onCancel != null,
            child: Padding(
              padding: only(top: 18),
              child: CommonClickWidget(
                singleClick: () {
                  widget.onCancel?.call();
                },
                child: CommonText(
                  '不同意',
                  color: ThemeUtil.getPlaceholderColor(context),
                ),
              ),
            ),
          ),
          sizeBox(height: 13),
        ],
      ),
    );
  }
}
