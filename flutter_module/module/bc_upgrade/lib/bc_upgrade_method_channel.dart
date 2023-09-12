import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bc_upgrade_platform_interface.dart';
import 'update_model.dart';

/// An implementation of [BcUpgradePlatform] that uses method channels.
class MethodChannelBcUpgrade extends BcUpgradePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bc_app_upgrade');
  final listenerChannel = const EventChannel('bc_app_upgrade_listener');
  StreamSubscription? _listenerStream;


  @override
  Future<String?> getVersionName() async {
    final version = await methodChannel.invokeMethod<String>('getVersionName');
    return version;
  }

  @override
  Future<int> getVersionCode() async {
    return await methodChannel.invokeMethod('getVersionCode');
  }

  @override
  Future<bool> update(UpdateModel model) async {
    return await methodChannel.invokeMethod('update', {
      'model': model.toJson(),
    });
  }

  @override
  Future<bool> cancel() async {
    return await methodChannel.invokeMethod('cancel');
  }

  @override
  listener(Function callback) {
    if (!Platform.isAndroid) return;
    _listenerStream = listenerChannel.receiveBroadcastStream().listen((data) {
      Map<String, dynamic> map = jsonDecode(data);
      callback(map);
    });
  }

  @override
  dispose() {
    _listenerStream?.cancel();
  }
}
