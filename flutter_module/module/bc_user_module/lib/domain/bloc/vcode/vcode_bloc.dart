import 'package:bc_user_module/domain/request/send_msg_request.dart';
import 'package:common_lib/index.dart';

part 'vcode_event.dart';

part 'vcode_state.dart';

class VcodeBloc extends BaseLoadBloc<VcodeEvent, VcodeState> {
  final ValueChanged valueChanged;

  VcodeBloc(view,{required this.valueChanged}) : super(view, InitialVcodeState());


  final DataChangeBloc<bool> vCodeBtnValidBloc = DataChangeBloc(data: false);

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
