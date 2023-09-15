import 'package:flutter/material.dart';
import 'package:flutter_module/common/service/event_extension.dart';
import 'package:flutter_module/module/user/domain/request/user_sp.dart';
import 'package:flutter_module/module/user/domain/bloc/user_info/user_center_bloc.dart';
import 'package:flutter_module/module/user/domain/model/login_info_entity.dart';
import 'package:flutter_module/module/user/domain/request/login_request.dart';
import 'package:todo_flutter/todo_flutter.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  bool accountValid = false;
  bool pwdValid = false;
  bool isCheckedAgreement = false;
  final FocusNode psdNode = FocusNode();
  final FocusNode accountNode = FocusNode();
  final GlobalKey<FormState> accountFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pwdFormKey = GlobalKey<FormState>();
  TextEditingController psdController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  final DataChangeBloc<bool> loginBtnValidBloc = DataChangeBloc(false);
  final DataChangeBloc<bool> deviceIdBloc = DataChangeBloc(true);
  final ScrollController controller = ScrollController();

  LoginBloc() : super(LoginInitial(null)) {
    _init();
  }

  void _init() {
    if ((UserSp.account ?? '').isNotEmpty &&
        (UserSp.password ?? '').isNotEmpty) {
      accountController.text = UserSp.account;
      psdController.text = UserSp.password;
    }
  }

  void login() {
    if (!isCheckedAgreement) {
      showToast('请先同意《用户服务协议》和《隐私政策》');
      return;
    }
    if (accountFormKey.currentState!.validate() &&
        pwdFormKey.currentState!.validate()) {
      add(LoginByPsdEvent(
          accountController.text, psdController.text, isCheckedAgreement));
    }
  }

  void logout(equipmentId, token) {
    add(Logout(equipmentId, token));
  }

  void saveLoginInfo(LoginInfoEntity data) {
    UserSp.setToken(data.token ?? '');
    UserSp.setUserId(data.userId ?? '');
    UserCenterBloc.instance.refreshUserInfo();
    // userModuleProvider.sendMsg(LoginSuccessModuleMessage(data));
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
