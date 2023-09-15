import 'package:flutter/material.dart';
import 'package:flutter_module/common/service/event_extension.dart';
import 'package:flutter_module/module/user/domain/bloc/vcode/vcode_bloc.dart';
import 'package:flutter_module/module/user/domain/request/forget_pwd_request.dart';
import 'package:flutter_module/module/user/domain/request/send_msg_request.dart';
import 'package:todo_flutter/todo_flutter.dart';

part 'password_manager_event.dart';

part 'password_manager_state.dart';

class PasswordManagerBloc
    extends BaseBloc<PasswordManagerEvent, PasswordManagerState> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pwdFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> vcCodeFormKey = GlobalKey<FormState>();
  final DataChangeBloc<bool> resetBtnValidBloc = DataChangeBloc(false);

  late VcodeBloc vcodeBloc;

  bool phoneValid = false;
  bool pwdValid = false;
  bool vcCodeValid = false;

  PasswordManagerBloc() : super(PasswordManagerInitial());

  void init() {
    vcodeBloc = VcodeBloc(valueChanged: (data) {
      print('data111');
      print(data);
    });
  }

  void sendMsg() {
    print('获取验证码');
    add(SendMsgEvent(phoneController.text));
  }

  void resetPwd() {
    add(
      ResetPwdEvent(
        phoneController.text,
        codeController.text,
        passWordController.text,
      ),
    );
  }

  pwdCheck() {
    pwdValid = pwdFormKey.currentState!.validate();
    resetBtnValidBloc.changeData(vcCodeValid && pwdValid && phoneValid);
  }

  vcCodeCheck() {
    vcCodeValid = vcCodeFormKey.currentState!.validate();
    resetBtnValidBloc.changeData(vcCodeValid && pwdValid && phoneValid);
  }

  phoneCheck() {
    phoneValid = phoneFormKey.currentState!.validate();
    vcodeBloc.vCodeBtnValidBloc.changeData(phoneValid);
    resetBtnValidBloc.changeData(vcCodeValid && pwdValid && phoneValid);
  }
}
