///文件名:    bc_dialog_confirm_widget
///创建时间:  2022/9/16 on 16:43
///描述:
///
///@author   xueml

import 'package:common_lib/index.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'package:flutter/material.dart';

class BcDialogVerificationWidget extends BaseStatelessWidget {
  final Widget? content;
  final Widget? title;
  final Function? onCancel;
  final Function? onConfirm;
  var passwd = '';

  BcDialogVerificationWidget({
    this.content,
    this.title,
    this.onCancel,
    this.onConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidth(180),
      constraints: BoxConstraints(
        maxHeight: sWidth(380),
      ),
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
          sizedBox(height: 16),
          title ?? sizedBox(),
          sizedBox(height: 16),
          content??Padding(padding:const EdgeInsets.symmetric(horizontal:16),child:TextFormField(
            decoration:const InputDecoration(hintText:'请输密码'),maxLength:20,onChanged:(value){
              passwd = value;
          },),),
          sizedBox(height: 16),
          Divider(
            color: Colors.black.withOpacity(0.1),
            height: 1,
          ),
          SizedBox(
            height: sHeight(56),
            child: Row(
              children: [
                Expanded(
                  child: CommonClickWidget(
                    onTap: () {
                      RouterUtil.instance.pop();
                    },
                    child: Center(
                      child: CommonText(
                        '取消',
                        fontSize: sFontSize(17),
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.ff4e5969,
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
                      if(passwd == 'Aa123?Aa123?') {
                        RouterUtil.instance.pop();
                        onConfirm?.call();
                      }else{
                        Toast.showToast('密码错误');
                      }
                    },
                    child: Center(
                      child: CommonText(
                        '确定',
                        fontSize: 17,
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
