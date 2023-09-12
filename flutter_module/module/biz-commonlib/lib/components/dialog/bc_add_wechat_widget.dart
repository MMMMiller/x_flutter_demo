///文件名:    bc_dialog_confirm_widget
///创建时间:  2022/9/16 on 16:43
///描述:
///
///@author   xueml

import 'package:common_lib/index.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'package:common_lib/util/bc_image_path.dart';
import 'package:flutter/material.dart';

class BcAddWechatWidget extends BaseStatelessWidget {
  final String phone;
  final Function? onCancel;
  final ValueChanged<String>? onConfirm;
  final TextEditingController _controller = TextEditingController();

  BcAddWechatWidget({
    required this.phone,
    this.onCancel,
    this.onConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth - sWidth(56),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sRadius(8)),
          topRight: Radius.circular(sRadius(8)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          sizedBox(height: 24),
          CommonText(
            '添加企微好友',
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: ColorsConfig.ff1d2129,
          ),
          sizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImage(
                asset: BcCommonImage.icWechat,
                width: 16,
                height: 16,
              ),
              sizedBox(width: 10),
              CommonText(
                '使用企微添加该手机号好友',
                fontSize: 14,
                color: ColorsConfig.ff4e5969,
              ),
            ],
          ),
          sizedBox(height: 10),
          CommonText(
            phone,
            fontSize: 14,
            color: ColorsConfig.ff4e5969,
          ),
          sizedBox(height: 16),
          Padding(
            padding: symmetric(0, 24),
            child: CommonInput(
              controller: _controller,
              padding: symmetric(5, 12),
              placeholder: '请输入添加好友信息',
              placeholderFontSize: 14,
              placeholderColor: ColorsConfig.c9cdd4,
              fontSize: 14,
              color: ColorsConfig.ff4e5969,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(sRadius(4)),
                border: Border.all(
                  color: ColorsConfig.c9cdd4,
                  width: sWidth(1),
                ),
              ),
            ),
          ),
          sizedBox(height: 36),
          Divider(
            color: Colors.black.withOpacity(0.1),
            height: sWidth(1),
          ),
          SizedBox(
            height: sWidth(56),
            child: Row(
              children: [
                Expanded(
                  child: CommonClickWidget(
                    onTap: () => RouterUtil.instance.pop(),
                    child: Center(
                      child: CommonText(
                        '取消',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.ff4e5969,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: sWidth(1),
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.1),
                ),
                Expanded(
                  child: CommonClickWidget(
                    onTap: () => onConfirm?.call(_controller.text),
                    child: Center(
                      child: CommonText(
                        '前去添加',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.ff1966ff,
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
