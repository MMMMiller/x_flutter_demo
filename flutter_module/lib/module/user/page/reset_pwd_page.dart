///文件名:    reset_pwd_page
///创建时间:  2022/9/14 on 10:19
///描述:
///
///@author   xueml

import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/common/util/colors_config.dart';
import 'package:flutter_module/module/user/domain/bloc/password/password_manager_bloc.dart';
import 'package:todo_flutter/todo_flutter.dart';

class ResetPwdPage extends StatefulWidget {
  const ResetPwdPage({super.key});

  @override
  ResetPwdPageState createState() => ResetPwdPageState();
}

class ResetPwdPageState extends BaseState<ResetPwdPage> {
  PasswordManagerBloc get bloc => getBloc<PasswordManagerBloc>();

  @override
  void initState() {
    super.initState();
    addBloc(PasswordManagerBloc()
      ..setState(this)
      ..init());
  }

  @override
  void sendEventToView(String type, [data]) {
    super.sendEventToView(type, data);
  }

  // @override
  // void sendEventToView(ViewEvent event) {
  //   if (event is ShowComfirmLoginDialogEvent) {
  //     BcDialog.showNoCancelDialog(context,
  //         title: '修改成功',
  //         content: '密码已重置，请通过新密码登录',
  //         confirmText: '返回登录',
  //         onConfirm: () => {
  //               UserCenterBloc.instance.cleanUserInfo(),
  //
  //               /// TODO
  //               // RouterUtil.instance.popUntil(BcRouteName.loginPage),
  //             });
  //   }
  //   super.sendEventToView(event);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Form(
            key: bloc.phoneFormKey,
            onChanged: () => bloc.phoneCheck(),
            child: Container(
              height: 64,
              // child: BcInputLayoutWidget(
              //   controller: bloc.phoneController,
              //   hint: '请输入手机号码',
              //   maxLength: 11,
              //   showClear: true,
              //   prefix: const Icon(CommonIcon.icMobile, size: 16),
              //   validator: (text) {
              //     if (text == null || text.isEmpty) {
              //       return '请输入手机号码';
              //     }
              //     RegExp regex = new RegExp(r'^1([3456789])\d{9}$');
              //     if (!regex.hasMatch(text)) {
              //       return '请输入正确的手机号码';
              //     }
              //     return null;
              //   },
              // ),
            ),
          ),
          sizedBox(height: 8),
          Form(
            key: bloc.vcCodeFormKey,
            onChanged: () => bloc.vcCodeCheck(),
            child: Container(
              height: 64,
              // child: BcInputLayoutWidget(
              //   controller: bloc.codeController,
              //   hint: '请输入验证码',
              //   maxLength: 6,
              //   prefix: const Icon(CommonIcon.icShake, size: 16),
              //   suffix: VcodeWidget(
              //     bloc.vcodeBloc,
              //     getVcodeFunction: () {
              //       if (bloc.phoneFormKey.currentState!.validate()) {
              //         bloc.vcodeBloc
              //             .getForgetPsdVcode(bloc.phoneController.text);
              //       }
              //     },
              //   ),
              // ),
            ),
          ),
          sizedBox(height: 8),
          Form(
            key: bloc.pwdFormKey,
            onChanged: () => bloc.pwdCheck(),
            child: Container(
              height: 64,
              // child: BcInputLayoutWidget(
              //   obscureText: true,
              //   maxLength: 16,
              //   controller: bloc.passWordController,
              //   hint: '密码由8-16位字母和数字组合',
              //   prefix: const Icon(CommonIcon.icLock, size: 16),
              //   validator: (text) {
              //     if (text == null || text.isEmpty) {
              //       return '请输入密码';
              //     }
              //     if (text.length < 8 || text.length > 16) {
              //       return '请输入8-16位字母和数字组合';
              //     }
              //
              //     RegExp regex =
              //         RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{1,}$');
              //     if (!regex.hasMatch(text)) {
              //       return '请输入8-16位字母和数字组合';
              //     }
              //     print(text);
              //     return null;
              //   },
              // ),
            ),
          ),
          sizedBox(height: 48),
          DataChangeWidget<bool>(
              bloc: bloc.resetBtnValidBloc,
              child: (context, btnState) {
                return CommonButton(
                  '确定',
                  fontSize: 14,
                  disable: !btnState!,
                  color: ColorsConfig.primaryColor,
                  radius: 4,
                  margin: const EdgeInsets.only(top: 16),
                  onPressed: () {
                    BoostNavigator.instance.push("NativeViewController",
                        arguments: {"a": "a", "b": "a"});
                    // bloc.resetPwd();
                  },
                );
              }),
        ],
      ),
    );
  }
}
