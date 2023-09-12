part of 'app_update_bloc.dart';

@immutable
abstract class AppUpdateEvent
    extends YBaseEvent<AppUpdateBloc, AppUpdateState> {
  AppUpdateEvent();
}

class CheckUpdateEvent extends AppUpdateEvent {
  @override
  Stream<AppUpdateState> applyAsync(
    AppUpdateBloc bloc,
    AppUpdateState currentState,
  ) async* {
    await Future.delayed(Duration(milliseconds: 200));
    final s = packInfoService.buildNumber ?? '';
    final currentVersion = int.parse(s.replaceAll('.', ''));
    final baseNetEntity = await CheckUpdateRequest('$currentVersion').load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    if (baseNetEntity.data?.updateType == 2) {
      Log.i('不需要提示更新');
    } else {
      bloc.view?.sendEventToView(AppUpdateViewEvent(baseNetEntity.data!));
    }
    yield currentState;
  }
}

class CheckUpdateLoadingEvent extends AppUpdateEvent {
  @override
  Stream<AppUpdateState> applyAsync(
    AppUpdateBloc bloc,
    AppUpdateState currentState,
  ) async* {
    final s = packInfoService.buildNumber ?? '';
    final currentVersion = int.parse(s.replaceAll('.', ''));
    bloc.view?.showLoadingDialog();
    final baseNetEntity = await CheckUpdateRequest('$currentVersion').load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    bloc.view?.dismissDialog();
    if (baseNetEntity.data?.updateType == 2) {
      bloc.view?.toast('当前已是最新版本');
    } else {
      bloc.view?.sendEventToView(AppUpdateViewEvent(baseNetEntity.data!));
    }
    yield currentState;
  }
}
