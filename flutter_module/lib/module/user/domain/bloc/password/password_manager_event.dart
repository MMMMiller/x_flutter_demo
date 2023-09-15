part of 'password_manager_bloc.dart';

@immutable
abstract class PasswordManagerEvent
    extends BaseEvent<PasswordManagerBloc, PasswordManagerState> {
  PasswordManagerEvent();
}

class SendMsgEvent extends PasswordManagerEvent {
  final String phone;

  SendMsgEvent(this.phone);

  @override
  Future<PasswordManagerState> on(
      PasswordManagerBloc bloc, PasswordManagerState currentState) async {
    showLoading();
    if (ObjectUtil.isEmpty(phone)) {
      throw UnknownException('请输入手机号');
    }
    final baseNetEntity = await SendMsgRequest(phone).request();
    isSuccess(bloc, baseNetEntity);
    dismissLoading();
    showToast('短信发送成功，请查收');
    return currentState;
  }
}

class ResetPwdEvent extends PasswordManagerEvent {
  final String phone;
  final String vcode;
  final String password;

  ResetPwdEvent(this.phone, this.vcode, this.password);

  @override
  Future<PasswordManagerState> on(
      PasswordManagerBloc bloc, PasswordManagerState currentState) async {
    if (ObjectUtil.isEmpty(phone)) {
      throw UnknownException('请输入手机号');
    }
    if (ObjectUtil.isEmpty(password)) {
      throw UnknownException('请输入密码');
    }
    if (ObjectUtil.isEmpty(vcode)) {
      throw UnknownException('请输入验证码');
    }

    showLoading();
    final baseNetEntity =
        await ForgetPwdRequest(password, password, phone, vcode).request();
    dismissLoading();
    isSuccess(bloc, baseNetEntity);
    bloc.sendEventToView('showDialog');
    return currentState;
  }
}
