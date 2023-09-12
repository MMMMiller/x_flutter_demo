import 'package:x_framework/base/index.dart';

import '../env/env.dart';
import 'env_state.dart';
import 'env_bloc.dart';
abstract class EnvEvent extends XBaseEvent<EnvBloc, EnvState> {}

class ChangeEnvEvent extends EnvEvent {
  final Env env;

  ChangeEnvEvent(this.env);

  @override
  Stream<EnvState> applyAsync(EnvBloc bloc, EnvState currentState) async* {
    Env.env = env;
    yield EnvInitState(env);
  }
}
