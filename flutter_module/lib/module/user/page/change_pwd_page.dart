///文件名:    reset_pwd_page
///创建时间:  2022/9/14 on 10:19
///描述:
///
///@author   xueml

import 'package:flutter/material.dart';
import 'package:flutter_module/module/user/domain/bloc/password/password_manager_bloc.dart';
import 'package:flutter_module/module/user/domain/bloc/user_info/user_center_bloc.dart';
import 'package:todo_flutter/todo_flutter.dart';

class ChangePwdPage extends StatefulWidget {
  const ChangePwdPage({super.key});

  @override
  ChangePwdPageState createState() => ChangePwdPageState();
}

class ChangePwdPageState extends BaseState<ChangePwdPage> {
  @override
  void sendEventToView(String type, [data]) {
    super.sendEventToView(type, data);
  }

  // @override
  // void sendEventToView(String type, [data]) {
  //   if (event is ShowComfirmLoginDialogEvent) {
  //     BcDialog.showNoCancelDialog(context,
  //         title: '修改成功',
  //         content: '密码已重置，请通过新密码登录',
  //         confirmText: '返回登录',
  //         onConfirm: () => {
  //               // UserCenterBloc.instance.cleanUserInfo(),
  //               // RouterUtil.instance
  //               //     .build(BcRouteName.loginPage)
  //               //     .navigateClear(),
  //             });
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: symmetric(vertical: 24,horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding:symmetric(vertical: 10,horizontal: 0),
            child: Row(
              children: [
                // const Icon(
                //   CommonIcon.icMobile,
                //   size: 16,
                //   color: ColorsConfig.ff4e5969,
                // ),
                sizedBox(width: 16)
                // CommonText(
                //   desensitization(
                //     UserCenterBloc.instance.state.userInfoEntity?.employeeBase
                //             ?.phone ??
                //         '-',
                //   ),
                //   fontSize: 16,
                // )
              ],
            ),
          ),
          sizedBox(height: 24),
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
              //       bloc.vcodeBloc.getForgetPsdVcode(UserCenterBloc.instance
              //               .state.userInfoEntity?.employeeBase?.phone ??
              //           '');
              //     },
              //   ),
              // ),
            ),
          ),
          sizedBox(height: 16),
          sizedBox(height: 8),
          Form(
            key: bloc.pwdFormKey,
            onChanged: () => bloc.pwdCheck(),
            child: Container(
              height: 64,
              // child: BcInputLayoutWidget(
              //   obscureText: true,
              //   controller: bloc.passWordController,
              //   maxLength: 16,
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
          // DataChangeWidget(
          //     dataChangeBloc: bloc.resetBtnValidBloc,
          //     child: (BuildContext context, DataChangeState btnState) {
          //       return CommonButton(
          //         '确定',
          //         fontSize: 14,
          //         disable: !btnState.data,
          //         color: ThemeUtil.getPrimaryColor(context),
          //         radius: 4,
          //         margin: const EdgeInsets.only(top: 16),
          //         onPressed: () {
          //           bloc.resetPwd();
          //         },
          //       );
          //     }),
        ],
      ),
    );
  }
  //
  // @override
  // PreferredSizeWidget? get bcAppBar => BcAppBar(
  //       title: '忘记密码',
  //       elevation: 0,
  //     );

  @override
  void initState() {
    super.initState();
    addBloc(PasswordManagerBloc()..setState(this)..init());
    bloc.vcodeBloc.vCodeBtnValidBloc.changeData(true);
    bloc.phoneController.text =
        UserCenterBloc.instance.state.userInfoEntity?.employeeBase?.phone ?? '';
    bloc.phoneValid = true;
  }

  PasswordManagerBloc get bloc => getBloc<PasswordManagerBloc>();
}
