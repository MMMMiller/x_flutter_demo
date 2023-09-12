import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bc_upgrade_method_channel.dart';
import 'update_model.dart';

abstract class BcUpgradePlatform extends PlatformInterface {
  /// Constructs a BcUpgradePlatform.
  BcUpgradePlatform() : super(token: _token);

  static final Object _token = Object();

  static BcUpgradePlatform _instance = MethodChannelBcUpgrade();

  /// The default instance of [BcUpgradePlatform] to use.
  ///
  /// Defaults to [MethodChannelBcUpgrade].
  static BcUpgradePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BcUpgradePlatform] when
  /// they register themselves.
  static set instance(BcUpgradePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getVersionName();
  Future<int> getVersionCode();
  Future<bool> update(UpdateModel model);
  Future<bool> cancel();
  listener(Function callback);
  dispose();
}
