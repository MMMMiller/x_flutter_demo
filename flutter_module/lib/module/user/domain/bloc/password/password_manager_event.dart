part of 'password_manager_bloc.dart';

@immutable
abstract class PasswordManagerEvent
    extends XBaseEvent<PasswordManagerBloc, PasswordManagerState> {
  PasswordManagerEvent();
}

class SendMsgEvent extends PasswordManagerEvent {
  final String phone;

  SendMsgEvent(this.phone);

  @override
  Stream<PasswordManagerState> applyAsync(
    PasswordManagerBloc bloc,
    PasswordManagerState currentState,
  ) async* {
    bloc.view?.showLoadingDialog();
    if (isEmptyString(phone)) {
      throw DomainException('请输入手机号');
    }
    final baseNetEntity = await SendMsgRequest(phone).load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    bloc.view?.dismissDialog();
    bloc.view?.toast('短信发送成功，请查收');
    yield currentState;
  }
}

class ResetPwdEvent extends PasswordManagerEvent {
  final String phone;
  final String vcode;
  final String password;

  ResetPwdEvent(this.phone, this.vcode, this.password);

  @override
  Stream<PasswordManagerState> applyAsync(
    PasswordManagerBloc bloc,
    PasswordManagerState currentState,
  ) async* {

    if (isEmptyString(phone)) {
      throw DomainException('请输入手机号');
    }
    if (isEmptyString(password)) {
      throw DomainException('请输入密码');
    }
    if (isEmptyString(vcode)) {
      throw DomainException('请输入验证码');
    }

    bloc.view!.showLoadingDialog();
    final baseNetEntity =
        await ForgetPwdRequest(password, password, phone, vcode).load();
    bloc.view!.dismissDialog();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }

    bloc.view!.sendEventToView(ShowComfirmLoginDialogEvent());
    yield currentState;
  }
}

class ShowComfirmLoginDialogEvent extends ViewEvent {}