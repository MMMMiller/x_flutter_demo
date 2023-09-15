part of 'vcode_bloc.dart';

@immutable
abstract class VcodeEvent extends BaseEvent<VcodeBloc, VcodeState> {
  VcodeEvent();
}

class GetVcodeEvent extends VcodeEvent {
  final String phone;

  GetVcodeEvent(this.phone);

  @override
  Stream<VcodeState> applyAsync(
      VcodeBloc bloc, VcodeState currentState) async* {
    yield InVocdeState();
  }

  @override
  Future<VcodeState> on(VcodeBloc bloc, VcodeState currentState) async {
    print('object event');
    if (ObjectUtil.isEmpty(phone)) {
      throw UnknownException('请输入您的手机号码');
    }
    showLoading();
    final baseNetEntity = await SendMsgRequest(phone).request();
    dismissLoading();
    isSuccess(bloc, baseNetEntity);
    showToast('短信发送成功，请查收');
    print('yield event');
    return InVocdeState();
  }
}

class ResetVcode extends VcodeEvent {
  @override
  Future<VcodeState> on(VcodeBloc bloc, VcodeState currentState) async {
    return InVocdeState();
  }
}
