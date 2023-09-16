part of 'cms_bloc.dart';

abstract class CmsEvent extends BaseEvent<CmsBloc, CmsState> {
  CmsEvent();
}

class InitCmsEvent extends CmsEvent {
  @override
  Future<CmsState> on(CmsBloc bloc, CmsState currentState) async {
    showLoading();
    final baseNetEntity = await CmsRequest(bloc._id).request();
    isSuccess(bloc, baseNetEntity);
    dismissLoading();
    return CmsInitialState(baseNetEntity.data);
  }
}

