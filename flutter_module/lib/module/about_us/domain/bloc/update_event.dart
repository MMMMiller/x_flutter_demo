part of 'update_bloc.dart';

abstract class UpdateEvent extends BaseEvent<UpdateBloc, UpdateState> {
  UpdateEvent();
}

class VersionInfoEvent extends UpdateEvent {
  final String channelCode;
  final String platform;
  final String tenantAppId;
  final String version;

  VersionInfoEvent(
      {required this.channelCode,
      required this.platform,
      required this.tenantAppId,
      required this.version});

  @override
  Future<UpdateState> on(UpdateBloc bloc, UpdateState currentState) async {
    showLoading();
    final baseNetEntity =
        await UpdateInfoRequest(channelCode, platform, tenantAppId, version)
            .request();
    isSuccess(bloc, baseNetEntity);
    dismissLoading();
    UserCenterBloc.instance.cleanUserInfo();
    return currentState;
  }
}
