import 'package:common_lib/service/local_storage/custom_cache_manager.dart';
import 'package:common_lib/service/log/log_delegate.dart';
import 'package:x_framework/provider/x_base_provider_builder.dart';
import 'package:x_framework/provider/x_local_storage.dart';
import 'package:x_framework/provider/x_log.dart';
import 'package:x_framework/service/local_storage/local_storage_service.dart';
import 'package:x_framework/service/log/x_default_log.dart';
import 'package:logger/logger.dart';

abstract class CommonBaseProviderBuilder extends XBaseProviderBuilder {
  final _localStorage = LocalStorageService(CustomCacheManager());

  final _log = XDefaultLog(
    filter: LogFilterDelegate(),
    printer: PrettyPrinter(
      colors: false,
      printEmojis: false,
      methodCount: 5,
    ),
  );

  @override
  XLocalStorage get localStorage => _localStorage;

  @override
  XLog get log => _log;
}
