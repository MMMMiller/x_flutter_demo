
import 'package:x_framework/base/index.dart';
import 'env_event.dart';
import 'env_state.dart';
import '../env/env.dart';
class EnvBloc extends BaseBloc<EnvEvent, EnvState> {
  static EnvBloc get instance => _getInstance();
  static EnvBloc? _instance;

  static EnvBloc _getInstance() {
    _instance ??= EnvBloc();
    return _instance!;
  }


  EnvBloc() : super(EnvInitState(Env.env));

  void changeDev() {
    add(ChangeEnvEvent(Env.dev));
  }

  void changeTest() {
    add(ChangeEnvEvent(Env.test));
  }

  void changePre() {
    add(ChangeEnvEvent(Env.pre));
  }

  void changeRelease() {
    add(ChangeEnvEvent(Env.release));
  }

}
