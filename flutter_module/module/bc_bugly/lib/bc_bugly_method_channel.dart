import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bc_bugly_platform_interface.dart';

/// An implementation of [BcBuglyPlatform] that uses method channels.
class MethodChannelBcBugly extends BcBuglyPlatform {
  bool postCaught = false;
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bc_app_bugly');


  /// 初始化
  @override
  Future<bool> init({
    String? androidAppId,
    String? iOSAppId,
    String? channel
  }) async {
    assert(
    (Platform.isAndroid && androidAppId != null) ||
        (Platform.isIOS && iOSAppId != null),
    );
    Map<String, Object?> map = {
      "appId": Platform.isAndroid ? androidAppId : iOSAppId,
      "channel": channel
    };
    final dynamic result = await methodChannel.invokeMethod('initBugly', map);
    return result;
  }

  /// 自定义渠道标识，Android 专用
  @override
  Future<void> setAppChannel(String channel) async {
    assert(Platform.isAndroid, 'setAppChannel only supports on Android.');
    if (Platform.isAndroid) {
      Map<String, Object> map = {"channel": channel};
      await methodChannel.invokeMethod('setAppChannel', map);
    }
  }

  /// 设置用户标识
  @override
  Future<void> setUserId(String userId) async {
    Map<String, Object> map = {"userId": userId};
    await methodChannel.invokeMethod('setUserId', map);
  }

  /// 设置标签
  /// [userTag] 标签 ID，可在网站生成
  Future<void> setUserTag(int userTag) async {
    Map<String, Object> map = {"userTag": userTag};
    await methodChannel.invokeMethod('setUserTag', map);
  }

  ///设置关键数据，随崩溃信息上报
  @override
  Future<void> putUserData({
    required String key,
    required String value,
  }) async {
    assert(key.isNotEmpty);
    assert(value.isNotEmpty);
    Map<String, Object> map = {"key": key, "value": value};
    await methodChannel.invokeMethod('putUserData', map);
  }


  /// 异常上报
  /// [callback] 运行的内容。
  /// [onException] 自定义异常处理，可用于异常打印、双上报等定制逻辑。该字段不影响上报。
  /// [filterRegExp] 针对 message 正则过滤异常上报。
  /// [debugUpload] 是否在调试模式也上报。
  @override
  void postCaughtException<T>(
      T Function() callback, {
        FlutterExceptionHandler? onException,
        String? filterRegExp,
        bool debugUpload = false,
      }) {
    bool isDebug = false;
    assert(isDebug = true);
    Isolate.current.addErrorListener(RawReceivePort((dynamic pair) {
      var isolateError = pair as List<dynamic>;
      var error = isolateError.first;
      var stackTrace = isolateError.last;
      Zone.current.handleUncaughtError(error,stackTrace);
    }).sendPort);
    // This captures errors reported by the Flutter framework.
    FlutterError.onError = (details) {
      if (details.stack != null) {
        if (debugUpload || !isDebug) {
          uploadException(
              message: details.exception.toString(),
              detail: details.stack.toString());
        }
        Zone.current.handleUncaughtError(details.exception, details.stack!);
      } else {
        FlutterError.presentError(details);
      }
    };
    postCaught = true;
    runZonedGuarded<Future<void>>(() async {
      callback();
    }, (error, stackTrace) {
      _filterAndUploadException(
        debugUpload,
        isDebug,
        onException,
        filterRegExp,
        FlutterErrorDetails(exception: error, stack: stackTrace),
      );
    });
  }

  void _filterAndUploadException(
      debugUpload,
      isDebug,
      handler,
      filterRegExp,
      FlutterErrorDetails details,
      ) {
    if (!_filterException(
      debugUpload,
      isDebug,
      handler,
      filterRegExp,
      details,
    )) {
      uploadException(
          message: details.exception.toString(),
          detail: details.stack.toString());
    }
  }

  bool _filterException(
      bool debugUpload,
      bool isDebug,
      FlutterExceptionHandler? handler,
      String? filterRegExp,
      FlutterErrorDetails details,
      ) {
    if (handler != null) {
      handler(details);
    } else {
      FlutterError.onError?.call(details);
    }
    // Debug 时默认不上传异常。
    if (!debugUpload && isDebug) {
      return true;
    }
    // 异常过滤。
    if (filterRegExp != null) {
      RegExp reg = RegExp(filterRegExp);
      Iterable<Match> matches = reg.allMatches(details.exception.toString());
      if (matches.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  /// 上报自定义异常信息，data 为文本附件
  /// Android 错误分析 => 跟踪数据 => extraMessage.txt
  /// iOS 错误分析 => 跟踪数据 => crash_attach.log
  @override
  Future<void> uploadException({
    required String message,
    required String detail,
    Map? data,
  }) async {
    var map = {};
    map.putIfAbsent("crash_message", () => message);
    map.putIfAbsent("crash_detail", () => detail);
    if (data != null) map.putIfAbsent("crash_data", () => data);
    await methodChannel.invokeMethod('postCaughtException', map);
  }

  @override
  void dispose() {
    postCaught = false;
  }
}
