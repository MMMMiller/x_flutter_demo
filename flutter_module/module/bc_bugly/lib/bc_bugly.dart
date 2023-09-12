
import 'package:flutter/foundation.dart';

import 'bc_bugly_platform_interface.dart';

class BcBugly {
  static Future<bool> init({
    String? androidAppId,
    String? iOSAppId,
    String? channel // 自定义渠道标识
  }){
    return BcBuglyPlatform.instance.init(androidAppId:androidAppId,iOSAppId:iOSAppId,channel:channel);
  }

  static Future<void> setAppChannel(String channel){
    return BcBuglyPlatform.instance.setAppChannel(channel);
  }

  static Future<void> setUserId(String userId){
    return BcBuglyPlatform.instance.setUserId(userId);
  }

  static Future<void> setUserTag(int userTag){
    return BcBuglyPlatform.instance.setUserTag(userTag);
  }
  static Future<void> putUserData({
    required String key,
    required String value,
  }){
    return BcBuglyPlatform.instance.putUserData(key: key, value: value);
  }
  static Future<void> uploadException({
    required String message,
    required String detail,
    Map? data,
  }){
    return BcBuglyPlatform.instance.uploadException(message: message, detail: detail,data:data);
  }

  static void postCaughtException<T>(
      T Function() callback, {
        FlutterExceptionHandler? onException,
        String? filterRegExp,
        bool debugUpload = false,
      }){
     BcBuglyPlatform.instance.postCaughtException(callback,onException:onException,filterRegExp:filterRegExp,debugUpload:debugUpload);
  }

  static dispose(){
    BcBuglyPlatform.instance.dispose();
  }
}
