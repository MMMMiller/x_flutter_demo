
import 'package:common_lib/index.dart';

///文件名:    common_interceptor
///创建时间:  2022/8/31 on 11:25
///描述:
///
///@author   xueml

class ApplicationInterceptors extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final headers = options.headers;
    // final mToken = ModuleService.userModuleProvider.token;
    // if (!isEmptyString(mToken)) {
    //   headers['token'] = ModuleService.userModuleProvider.token;
    // }
    Log.i('ApplicationInterceptors => ${options.uri.toString()}');
    return handler.next(options);
  }
}
