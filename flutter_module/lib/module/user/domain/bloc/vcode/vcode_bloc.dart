import 'package:flutter/material.dart';
import 'package:flutter_module/common/service/event_extension.dart';
import 'package:flutter_module/module/user/domain/request/send_msg_request.dart';
import 'package:todo_flutter/todo_flutter.dart';

part 'vcode_event.dart';

part 'vcode_state.dart';

class VcodeBloc extends BaseBloc<VcodeEvent, VcodeState> {
  final ValueChanged? valueChanged;

  VcodeBloc({required this.valueChanged}) : super(InitialVcodeState());

  final DataChangeBloc<bool> vCodeBtnValidBloc = DataChangeBloc(false);

  getForgetPsdVcode(String phone) {
    print('fgtpwd');
    add(GetVcodeEvent(phone));
  }

  resetVcode() {
    add(ResetVcode());
  }
}

class SendSmsType {
  static const REGISTER = 'register';
  static const FORGET_PSD = 'find';
  static const QUICK_LOGIN = 'quickLogin';
  static const UPDATE_PHONE = 'updatePhone';
  static const BIND_PHONE = 'bindPhone';
}
