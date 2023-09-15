part of 'user_center_bloc.dart';

abstract class UserCenterEvent
    extends BaseEvent<UserCenterBloc, UserCenterState> {
  UserCenterEvent();
}

class RefreshUserInfoEvent extends UserCenterEvent {
  @override
  Stream<UserCenterState> applyAsync(
    UserCenterBloc bloc,
    UserCenterState currentState,
  ) async* {
    final baseNetEntity = await UserInfoRequest().request();
    isSuccess(bloc, baseNetEntity);
    // deviceBloc.changeDeviceUser();
    yield UserCenterInitial(baseNetEntity.data);
  }

  @override
  Future<UserCenterState> on(
      UserCenterBloc bloc, UserCenterState currentState) async {
    return currentState;
  }
}

class LoadLocalUserInfoEvent extends UserCenterEvent {
  @override
  Future<UserCenterState> on(
      UserCenterBloc bloc, UserCenterState currentState) async {
    //TODO 重新实现一下
    return currentState;
  }
}
