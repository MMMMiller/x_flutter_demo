part of 'user_center_bloc.dart';

@immutable
abstract class UserCenterEvent
    extends XBaseEvent<UserCenterBloc, UserCenterState> {
  UserCenterEvent();
}

class RefreshUserInfoEvent extends UserCenterEvent {
  @override
  Stream<UserCenterState> applyAsync(
    UserCenterBloc bloc,
    UserCenterState currentState,
  ) async* {
    final baseNetEntity = await UserInfoRequest().load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    // deviceBloc.changeDeviceUser();
    yield UserCenterInitial(baseNetEntity.data);
  }
}

class LoadLocalUserInfoEvent extends UserCenterEvent {
  @override
  Stream<UserCenterState> applyAsync(
    UserCenterBloc bloc,
    UserCenterState currentState,
  ) async* {
    if (currentState.userInfoEntity == null) {
      final userInfo = await UserInfoRequest().loadLocal();
      if (userInfo != null) {
        // deviceBloc.changeDeviceUser();
        yield UserCenterInitial(userInfo);
      }
    } else {
      yield currentState;
    }
  }
}
