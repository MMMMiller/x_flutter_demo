import 'package:common_lib/index.dart';

///文件名:    base_module_provider
///创建时间:  2022/8/31 on 10:33
///描述:
///
///@author   xueml

mixin BaseModuleProvider {
  IModuleProvider get iModuleProvider;
}

IModuleMessageObserver _moduleMessageObserver = IModuleMessageObserver();

IModuleMessageObserver get moduleMessageObserver => _moduleMessageObserver;

abstract class IModuleProvider {

  void sendMsg(IModuleMessage message) {
    _moduleMessageObserver.hookModuleEvent(message);
  }

  Future<MResponseEntity> createSuccessData<T>({T? data}) {
    return Future.value(MResponseEntity.createSuccessData(data));
  }

  Future<MResponseEntity> createErrorData<T>({String? message}) {
    return Future.value(MResponseEntity.createErrorData(message));
  }
}

abstract class IModuleMessage {}

typedef IModuleMessageCallback = void Function(IModuleMessage event);

class IModuleMessageObserver {
  final List<IModuleMessageCallback> _listenerList = [];

  void hookModuleEvent(IModuleMessage message) {
    for (final element in _listenerList) {
      Log.i(
          'IModuleMessage：msg is ${message.runtimeType.toString()}，current has listener');
      element(message);
    }
  }

  void addModuleEventListener(IModuleMessageCallback eventCallback) {
    _listenerList.add(eventCallback);
  }

  void removeModuleEventListener(IModuleMessageCallback eventCallback) {
    _listenerList.remove(eventCallback);
  }
}
