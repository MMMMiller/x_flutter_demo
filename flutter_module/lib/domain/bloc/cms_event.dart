part of 'cms_bloc.dart';

@immutable
abstract class CmsEvent extends YBaseEvent<CmsBloc, CmsState> {
  CmsEvent();
}

class InitCmsEvent extends CmsEvent {
  @override
  Stream<CmsState> applyAsync(CmsBloc bloc, CmsState currentState) async* {
    bloc.pageLoading();
    final baseNetEntity = await GetCmsRequest(bloc._id).load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    bloc.pageSuccess();
    yield CmsInitialState(baseNetEntity.data);
  }
}

class RefreshCmsEvent extends CmsEvent {
  @override
  Stream<CmsState> applyAsync(CmsBloc bloc, CmsState currentState) async* {
    final baseNetEntity = await GetCmsRequest(bloc._id).load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }
    yield CmsInitialState(baseNetEntity.data);
  }
}
