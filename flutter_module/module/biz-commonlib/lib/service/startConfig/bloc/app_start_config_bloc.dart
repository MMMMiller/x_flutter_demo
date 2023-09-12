import 'dart:io';

import 'package:common_lib/common/bc_const.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/main.dart';
import 'package:common_lib/service/startConfig/model/app_start_config_entity.dart';
import 'package:common_lib/service/startConfig/repository/app_start_config_request.dart';
import 'package:common_lib/config/env_config/index.dart';


part 'app_start_config_event.dart';
part 'app_start_config_state.dart';

class AppStartConfigBloc extends BaseBloc<AppStartConfigEvent, AppStartConfigState> {

  static AppStartConfigBloc get instance => _getInstance();
  static AppStartConfigBloc? _instance;


  static AppStartConfigBloc _getInstance() {
    _instance ??= AppStartConfigBloc();
    return _instance!;
  }

  AppStartConfigBloc() : super(AppStartConfigInitial(null));

  void getAppStartConfig() {
    add(GetAppStartConfigEvent());
  }
}

