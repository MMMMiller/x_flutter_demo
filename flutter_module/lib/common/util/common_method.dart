
import 'package:common_lib/index.dart';
import 'package:flutter_module/framework/service/application_service.dart';
import 'app_sp.dart';

class CommonMethod {
  void restart(Env env) {
    Env.env = env;
    AppSp.setEnv(env.name);
    ApplicationService.instance.init();
  }
}