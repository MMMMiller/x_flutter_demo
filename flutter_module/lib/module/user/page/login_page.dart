import 'package:flutter/material.dart';
// import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/module/user/domain/bloc/login/login_bloc.dart';
import 'package:flutter_module/module/user/domain/bloc/user_info/user_center_bloc.dart';
import 'package:todo_flutter/todo_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends BaseState<LoginPage> with WidgetsBindingObserver {
  LoginBloc get loginBloc => getBloc<LoginBloc>();

  @override
  void initState() {
    super.initState();
    addBloc(LoginBloc()..setState(this));
    WidgetsBinding.instance.addObserver(this);
  }

  // @override
  // void onResume() {
  //   super.onResume();
  //   if (loginBloc.accountController.text.isNotEmpty) {
  //     loginBloc.accountCheck();
  //   }
  //
  //   if (loginBloc.psdController.text.isNotEmpty) {
  //     loginBloc.pwdCheck();
  //   }
  // }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (MediaQuery.of(context).viewInsets.bottom > 0) {
        loginBloc.deviceIdBloc.changeData(false);
        loginBloc.focusListener();
      } else {
        loginBloc.deviceIdBloc.changeData(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: UnFocusWidget(
          child: Padding(
            padding: symmetric(vertical: 0, horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: RemoveRippleWidget(
                    child: SingleChildScrollView(
                      controller: loginBloc.controller,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          sizedBox(height: 100),
                          // CommonImage(
                          //   asset: BcImagePath.logo,
                          //   width: 48,
                          //   height: 48,
                          // ),
                          sizedBox(height: 48),
                          Form(
                            key: loginBloc.accountFormKey,
                            onChanged: () => loginBloc.accountCheck(),
                            child: SizedBox(
                              height: 64,
                              // child: BcInputLayoutWidget(
                              //   controller: loginBloc.accountController,
                              //   focusNode: loginBloc.accountNode,
                              //   hint: '请输入用户名或手机号',
                              //   maxLength: 32,
                              //   showClear: true,
                              //   // prefix:
                              //   //     const Icon(CommonIcon.icMobile, size: 16),
                              // ),
                            ),
                          ),
                          sizedBox(height: 8),
                          Form(
                            key: loginBloc.pwdFormKey,
                            onChanged: () => loginBloc.pwdCheck(),
                            child: SizedBox(
                              height: 64,
                              // child: BcInputLayoutWidget(
                              //   controller: loginBloc.psdController,
                              //   focusNode: loginBloc.psdNode,
                              //   obscureText: true,
                              //   maxLength: 16,
                              //   hint: '请输入登录密码',
                              //   validator: (text) {
                              //     if (text == null || text.isEmpty) {
                              //       return '请输入登录密码';
                              //     }
                              //     return null;
                              //   },
                              //   // prefix: const Icon(CommonIcon.icLock, size: 16),
                              // ),
                            ),
                          ),
                          sizedBox(height: 8),
                          _renderResetPwdButton(),
                          sizedBox(height: 8),
                          DataChangeWidget<bool>(
                            bloc: loginBloc.loginBtnValidBloc,
                            child: (context, btnState) {
                              return CommonButton(
                                '登录123',
                                fontSize: 14,
                                disable: !btnState!,
                                radius: 4,
                                // color: ThemeUtil.getPrimaryColor(context),
                                margin: const EdgeInsets.only(top: 16),
                                onPressed: () {
                                  // BoostNavigator.instance.push(
                                  //     "SearchResultPage",
                                  //     arguments: {"a": "a", "b": "a"});
                                  // loginBloc.login();
                                },
                              );
                            },
                          ),
                          sizedBox(height: 6),
                          _renderOtherMenu(),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onDoubleTap: () {
                    // RouterUtil.instance.build(OutRouterName.developerPage).navigate();
                    // BcDialog.showVerificationDialog(context,
                    //     onConfirm: () => RouterUtil.instance
                    //         .build(OutRouterName.developerPage)
                    //         .navigate());
                  },
                  child: DataChangeWidget<bool>(
                    bloc: loginBloc.deviceIdBloc,
                    child: (_, uiState) {
                      return CommonText(
                        '设备ID：djfkwefwelkfnjwke',
                        // color: ThemeUtil.getDesColor(context),
                      );
                      //   BcDeviceInfoBuilder(
                      //   blocDeviceInfoBuild: (BcDeviceServiceState state) {
                      //     return uiState.data!
                      //         ? Padding(
                      //       padding: only(bottom: 34),
                      //       child: CommonText(
                      //         '设备ID：${state.deviceId}',
                      //         color: ThemeUtil.getDesColor(context),
                      //       ),
                      //     )
                      //         : sizeBox();
                      //   },
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderResetPwdButton() {
    return Row(
      children: [
        const Spacer(),
        CommonClickWidget(
          singleClick: () {
            // BoostNavigator.instance
            //     .push('user/reset_pwd_page', withContainer: true);
          },
          // RouterUtil.instance.build(BcRouteName.resetPwdPage).navigate(),
          child: CommonText(
            '忘记密码',
            fontSize: 14,
            // color: ThemeUtil.getPrimaryColor(context),
          ),
        ),
      ],
    );
  }

  Widget _renderOtherMenu() {
    return DataChangeWidget(
      bloc: UserCenterBloc.instance.agreementBloc,
      child: (context, agreementState) {
        return Row(
          children: [
            // BcCheckBox(
            //   isRound: true,
            //   isChecked: false,
            //   themeColor: ColorsConfig.ffff5e42,
            //   onChange: (checked) => {
            //     loginBloc.clickedCheckBox(),
            //   },
            // ),
            SizedBox(width: 8),
            // ExtendedText(
            //   '我已阅读并同意\$《服务协议》\$和\$《隐私协议》\$',
            //   textAlign: TextAlign.left,
            //   style: const TextStyle(
            //     fontSize: 12,
            //     color: ColorsConfig.ff86909c,
            //   ),
            //   specialTextSpanBuilder: MySpecialTextSpanBuilder(),
            //   onSpecialTextTap: (text) {
            //     if (text.contains('服务协议')) {
            //       // toWebPage(
            //       //   link: agreementState
            //       //       .data.service.agreementUrl,
            //       //   title: '服务协议',
            //       // );
            //     } else {
            //       // toWebPage(
            //       //     link: agreementState
            //       //         .data.privacy.agreementUrl,
            //       //     title: '隐私协议');
            //     }
            //   },
            // ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
