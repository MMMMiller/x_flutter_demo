import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bc_bugly_method_channel.dart';

abstract class BcBuglyPlatform extends PlatformInterface {
  /// Constructs a BcBuglyPlatform.
  BcBuglyPlatform() : super(token: _token);

  static final Object _token = Object();

  static BcBuglyPlatform _instance = MethodChannelBcBugly();

  /// The default instance of [BcBuglyPlatform] to use.
  ///
  /// Defaults to [MethodChannelBcBugly].
  static BcBuglyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BcBuglyPlatform] when
  /// they register themselves.
  static set instance(BcBuglyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> init({
    String? androidAppId,
    String? iOSAppId,
    String? channel // 自定义渠道标识
  });
  Future<void> setAppChannel(String channel);
  Future<void> setUserId(String userId);
  Future<void> setUserTag(int userTag);
  Future<void> putUserData({
    required String key,
    required String value,
  });
  Future<void> uploadException({
    required String message,
    required String detail,
    Map? data,
  });
  void postCaughtException<T>(
      T Function() callback, {
        FlutterExceptionHandler? onException,
        String? filterRegExp,
        bool debugUpload = false,
      });
  void dispose();
}
