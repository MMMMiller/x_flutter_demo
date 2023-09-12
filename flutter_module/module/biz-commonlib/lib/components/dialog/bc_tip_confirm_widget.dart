///文件名:    bc_dialog_confirm_widget
///创建时间:  2022/9/16 on 16:43
///描述:
///
///@author   xueml

import 'package:common_lib/index.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'package:flutter/material.dart';

class BcTipConfirmWidget extends BaseStatelessWidget {
  final String? content;
  final String? title;
  final Function? onCancel;
  final Function? onConfirm;
  final bool showCancel;
  final double actionFontSize;
  final String? confirmText;
  final String? cancelText;
  final TextAlign? contentTextAlign;

  BcTipConfirmWidget({
    this.content,
    this.title,
    this.onCancel,
    this.confirmText,
    this.showCancel = true,
    this.actionFontSize = 17,
    this.cancelText,
    this.onConfirm,
    this.contentTextAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidth(260),
      constraints: BoxConstraints(
        maxHeight: sWidth(380),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
         borderRadius:BorderRadius.circular(8),
        //borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(sRadius(8)),
        //   topRight: Radius.circular(sRadius(8)),
        // ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          sizedBox(height: 24),
          Visibility(
            visible: !isEmptyString(title),
            child: Padding(
              padding: symmetric(0, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    title ?? '提示',
                    fontSize: 17,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    color: ThemeUtil.getTitleMediumColor(context),
                  ),
                  sizedBox(height: 8),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !isEmptyString(content),
            child: Padding(
              padding: symmetric(0, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    content ?? '',
                    fontSize: 14,
                    textAlign: contentTextAlign ?? TextAlign.left,
                    color: ThemeUtil.getDesColor(context),
                  ),
                  sizedBox(height: 8),
                ],
              ),
            ),
          ),
          sizedBox(height: 16),
          Divider(
            color: Colors.black.withOpacity(0.1),
            height: 1,
          ),
          SizedBox(
            height: sHeight(48),
            child: Row(
              children: [
                Visibility(
                  visible: showCancel,
                  child: Expanded(
                    child: CommonClickWidget(
                      onTap: () {
                        onCancel?.call();
                      },
                      child: Center(
                        child: CommonText(
                          cancelText ?? '取消',
                          fontSize: sFontSize(actionFontSize),
                          fontWeight: FontWeight.w500,
                          color: ColorsConfig.ff4e5969,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: onConfirm != null,
                  child: Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                Expanded(
                  child: CommonClickWidget(
                    singleClick: () {
                      onConfirm?.call();
                    },
                    child: Center(
                      child: CommonText(
                        confirmText ?? '确定',
                        fontSize: actionFontSize,
                        fontWeight: FontWeight.w500,
                        color: ThemeUtil.getPrimaryColor(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
