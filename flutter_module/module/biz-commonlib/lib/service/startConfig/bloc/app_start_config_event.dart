part of 'app_start_config_bloc.dart';


abstract class AppStartConfigEvent
    extends XBaseEvent<AppStartConfigBloc, AppStartConfigState> {
  AppStartConfigEvent();
}

class GetAppStartConfigEvent extends AppStartConfigEvent {
  @override
  Stream<AppStartConfigState> applyAsync(AppStartConfigBloc bloc, AppStartConfigState currentState) async* {

    final baseNetEntity = await AppStartConfigeRequest().load();
    if (!isSuccess(baseNetEntity)) {
      handlerException(bloc, baseNetEntity);
    }

    print("baseNetEntity.data = ${baseNetEntity.data.toString()}");
   
    yield AppStartConfigInitial(baseNetEntity.data);
  }


}
