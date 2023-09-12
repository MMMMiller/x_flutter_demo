import '../env/env.dart';
abstract class EnvState {
  final Env env;

  EnvState(this.env);
}

class EnvInitState extends EnvState {
  EnvInitState(Env env) : super(env);
}
