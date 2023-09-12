enum Env {
  dev._('dev'),
  test._('test'),
  pre._('pre'),
  release._('release'),;


  final String name;
  const Env._(this.name);
  /// 默认是生产环境
  static Env env = Env.release;
  static bool get isRelease => env==Env.release;
}
