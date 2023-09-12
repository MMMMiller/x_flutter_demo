part of 'app_start_config_bloc.dart';

abstract class AppStartConfigState {

  final AppStartConfigEntity? appStartConfigEntityEntity;
  AppStartConfigState(this.appStartConfigEntityEntity);

  bool? get show => appStartConfigEntityEntity?.applyFlag;

  // bool get show => !(appStartConfigEntityEntity?.applyFlag ?? true);

}

class AppStartConfigInitial extends AppStartConfigState {
  AppStartConfigInitial(super.appStartConfigEntityEntity);


}