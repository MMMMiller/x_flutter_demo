import 'dart:collection';
export 'package:common_lib/base/src/m_response_entity.dart';
import 'package:common_lib/base/src/base_module_provider.dart';
import 'package:common_lib/index.dart';

abstract class BaseModule with BaseModuleProvider, ModuleTest {
  static final Set<BaseModule> _moduleSet = HashSet();


  static Set<BaseModule> get moduleSet => _moduleSet;

  void register() {
    Log.d('BaseModule：${toString()} is register');
    _moduleSet.add(this);
  }

  void remove() {
    Log.e('BaseModule：${toString()} is remove');
    _moduleSet.remove(this);
  }

  void clean() {
    Log.e('BaseModule：remove all module');
    _moduleSet.clear();
  }

  String get moduleKey => runtimeType.toString();
}


class ModuleManager {
  static const _mainModule = 'MainModule';

  static T getM<T extends BaseModule>() {
    final list = _getMList(T.toString());
    if (isEmptyList(list)) {
      throw ServiceException('无法找到${T.toString()}模块，请检查是否已初始化该模块');
    }
    return list.first as T;
  }

  static BaseModule getWithKey(String key) {
    final list = _getMList(key);
    if (isEmptyList(list)) {
      throw ServiceException('无法找到$key模块，请检查是否已初始化该模块');
    }
    return list.first;
  }

  static BaseModule getMainModule() {
    final list = _getMList(_mainModule);
    if (isEmptyList(list)) {
      throw ServiceException(
        '无法找到主模块，请在主模块中初始化runTimeType为$_mainModule或者moduleKey为$_mainModule的模块',
      );
    }
    return list.first;
  }

  static List<BaseModule> _getMList(String key) {
    return BaseModule.moduleSet
        .where((element) =>
            element.moduleKey == key || element.runtimeType.toString() == key)
        .toList();
  }
}

mixin ModuleTest {
  void initModuleTest() {
    Log.init();
  }
}
