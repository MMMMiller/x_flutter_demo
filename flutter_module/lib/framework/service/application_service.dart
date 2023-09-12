import 'dart:async';
import 'dart:io';

import 'package:common_lib/index.dart';
import 'package:common_lib/persistence/src/provider_service.dart';
import 'package:flutter_module/common/util/app_sp.dart';
import 'package:flutter_module/framework/api/application_interceptor.dart';
import 'package:flutter_module/framework/api/net_config_imp.dart';
import 'package:flutter_module/framework/service/bloc_delegate.dart';
import 'package:flutter_module/framework/service/module_service.dart';

/// 项目名:    gaea
/// 包名
/// 文件名:    application_service
/// 创建时间:  2022/8/23 on 16:51
/// 描述:
///
/// @author   xueml

class ApplicationService {
  factory ApplicationService() => _getInstance();

  ApplicationService._internal();

  static ApplicationService get instance => _getInstance();
  static ApplicationService? _instance;
  StreamSubscription? sub;

  static ApplicationService _getInstance() {
    _instance ??= ApplicationService._internal();
    return _instance!;
  }

  void init() {

    // 初始化日志模块
    Log.init();
    // 初始化持久层服务模块
    ProviderService.init(
      NetConfigImp(
        isProxy: AppSp.isProxy(),
        proxyIp: AppSp.getProxyIp(),
      ),
      interceptors: [ApplicationInterceptors()],
    );
    // 添加bloc中间件
    Bloc.observer = YDefaultBlocDelegate();

    final env = AppSp.getEnv();
    if(env.isEmpty || env == ''){
      // 初始化模块
      ModuleService.init();
    } else {
      sub = EnvBloc.instance.stream.listen((event) {
        sub?.cancel();
        // 初始化模块
        ModuleService.init();
      });
    }
    _initEnv(env);
  }

  void _initEnv(String env) {
    if (env == Env.dev.name) {
      EnvBloc.instance.changeDev();
    } else if (env == Env.test.name) {
      EnvBloc.instance.changeTest();
    } else if (env == Env.pre.name) {
      EnvBloc.instance.changePre();
    } else if (env == Env.release.name) {
      EnvBloc.instance.changeRelease();
    }
  }
}
