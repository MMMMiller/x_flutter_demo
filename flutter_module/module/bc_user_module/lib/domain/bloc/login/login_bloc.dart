import 'package:bc_user_api/model/index.dart';
import 'package:bc_user_module/common/user_sp.dart';
import 'package:bc_user_module/domain/bloc/device/device_bloc.dart';
import 'package:bc_user_module/main.dart';
import 'package:bc_user_module/domain/request/login_request.dart';
import 'package:bc_user_module/domain/bloc/user_info/user_center_bloc.dart';
import 'package:bc_user_module/router/out_router_name.dart';
import 'package:bc_user_module/router/bc_route_name.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends BaseLoadBloc<LoginEvent, LoginState> {
  bool accountValid = false;
  bool pwdValid = false;
  bool isCheckedAgreement = false;
  final FocusNode psdNode = FocusNode();
  final FocusNode accountNode = FocusNode();
  final GlobalKey<FormState> accountFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pwdFormKey = GlobalKey<FormState>();
  TextEditingController psdController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  final DataChangeBloc<bool> loginBtnValidBloc = DataChangeBloc(data: false);
  final DataChangeBloc<bool> deviceIdBloc = DataChangeBloc(data: true);
  final ScrollController controller = ScrollController();

  LoginBloc(ViewToBloc view) : super(view, LoginInitial(null)) {
    _init();
  }

  void _init() {
    if ((UserSp.account ?? '').isNotEmpty &&
        (UserSp.password ?? '').isNotEmpty) {
      accountController.text = UserSp.account!;
      psdController.text = UserSp.password!;
    }
  }

  void login() {
    if (!isCheckedAgreement) {
      view?.toast('请先同意《用户服务协议》和《隐私政策》');
      return;
    }
    if (accountFormKey.currentState!.validate() &&
        pwdFormKey.currentState!.validate()) {
      add(LoginByPsdEvent(
          accountController.text, psdController.text, isCheckedAgreement));
    }
  }
  void logout(equipmentId,token) {

    add(Logout(equipmentId,token));
  }

  void saveLoginInfo(LoginInfoEntity data) {
    UserSp.setToken(data.token ?? '');
    UserSp.setUserId(data.userId ?? '');
    UserCenterBloc.instance.refreshUserInfo();
    userModuleProvider.sendMsg(LoginSuccessModuleMessage(data));
  }

  void accountCheck() {
    accountValid = accountFormKey.currentState!.validate();
    loginBtnValidBloc.changeData(accountValid && pwdValid);
  }

  void pwdCheck() {
    pwdValid = pwdFormKey.currentState!.validate();
    loginBtnValidBloc.changeData(accountValid && pwdValid);
  }

  clickedCheckBox() {
    isCheckedAgreement = !isCheckedAgreement;
    accountCheck();
  }

  Future<void> focusListener() async {
    await controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 50),
      curve: Curves.linear,
    );
  }

  @override
  Future<void> close() {
    psdController.dispose();
    accountController.dispose();
    controller.dispose();
    accountNode.dispose();
    psdNode.dispose();
    deviceIdBloc.close();
    loginBtnValidBloc.close();
    return super.close();
  }
}
