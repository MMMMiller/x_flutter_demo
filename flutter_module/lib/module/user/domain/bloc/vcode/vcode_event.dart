part of 'vcode_bloc.dart';

@immutable
abstract class VcodeEvent extends XBaseEvent<VcodeBloc, VcodeState> {
  VcodeEvent();
}

class GetVcodeEvent extends VcodeEvent {
  final String phone;

  GetVcodeEvent(this.phone);

  @override
  Stream<VcodeState> applyAsync(
      VcodeBloc bloc, VcodeState currentState) async* {
    print('object event');
    if (isEmptyString(phone)) {
      throw DomainException('请输入您的手机号码');
    }
    bloc.view!.showLoadingDialog();
    final baseNetEntity = await SendMsgRequest(phone).load();
    bloc.view!.dismissDialog();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    bloc.view!.toast('短信发送成功，请查收');
    print('yield event');
    yield InVocdeState();
  }
}

class ResetVcode extends VcodeEvent {
  @override
  Stream<VcodeState> applyAsync(
      VcodeBloc bloc, VcodeState currentState) async* {
    yield UnVcodeState();
  }
}
