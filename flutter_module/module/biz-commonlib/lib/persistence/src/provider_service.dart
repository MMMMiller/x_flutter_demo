import 'dart:async';

import 'package:common_lib/generated/json/base/json_convert_content.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/router/common_router.dart';

/// 项目名:    gaea
/// 包名
/// 文件名:    provider_service
/// 创建时间:  2022/8/23 on 14:57
/// 描述:
///
/// @author   xueml

class ProviderService {
  static final Map<String, CommonBaseProviderBuilder> _defaultProviderMap = {};

  static late NetConfig _netConfig;

  static NetInfo get currentNetInfo => _netConfig.currentNetInfo;

  /// 网络拦截器
  static late List<Interceptor>? _interceptors;

  static void addProvider(String key, CommonBaseProviderBuilder provider) {
    if (provider.dio == null) {
      provider
          .setDio(DefaultDio(_netConfig.currentNetInfo, _interceptors ?? []));
    }
    _defaultProviderMap[key] = provider;
  }

  static StreamSubscription? _subscription;

  static CommonBaseProviderBuilder find(String key) {
    return _defaultProviderMap[key] ?? _defaultProviderMap[CommonProvider.key]!;
  }

  /// 初始化服务模块
  static void init(NetConfig netConfig, {List<Interceptor>? interceptors}) {
    _netConfig = netConfig;
    _interceptors = interceptors;
    addProvider(CommonProvider.key, CommonProvider());
    // 初始化公共路由
    CommonRouter.init();
    _listenerEnvChange();
  }

  static void _listenerEnvChange() {
    _subscription ??= EnvBloc.instance.stream.listen((event) {
      Log.d(event.env.name);
      _defaultProviderMap.forEach((key, value) {
        value
            .setDio(DefaultDio(_netConfig.currentNetInfo, _interceptors ?? []));
      });
    });
  }

  static void cancelListenerEnv() {
    _subscription?.cancel();
  }
}

class CommonProvider extends CommonBaseProviderBuilder {
  static String key = 'CommonProvider';

  final commonConverterFactory = CommonConverterFactory();

  @override
  XConverterFactory get converterFactory => commonConverterFactory;
}

class CommonConverterFactory extends BaseConverterFactory {
  @override
  M? fromJsonAsT<M>(json) {
    return JsonConvert.fromJsonAsT(json);
  }
}
