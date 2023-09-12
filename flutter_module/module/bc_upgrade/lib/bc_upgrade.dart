
import 'bc_upgrade_platform_interface.dart';
import 'update_model.dart';

class BcUpgrade {

  static Future<String?> getVersionName() {
    return BcUpgradePlatform.instance.getVersionName();
  }
  static Future<int> getVersionCode(){
    return BcUpgradePlatform.instance.getVersionCode();
  }

  static Future<bool> update(UpdateModel model) {
    return BcUpgradePlatform.instance.update(model);
  }

  static Future<bool> cancel(){
    return BcUpgradePlatform.instance.cancel();
  }
  static listener(Function callback) {
    return BcUpgradePlatform.instance.listener(callback);
  }

  static dispose() {
    return BcUpgradePlatform.instance.listener(dispose);
  }
}
