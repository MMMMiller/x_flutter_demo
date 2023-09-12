import 'package:bc_upgrade/update_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bc_upgrade/bc_upgrade.dart';
import 'package:bc_upgrade/bc_upgrade_platform_interface.dart';
import 'package:bc_upgrade/bc_upgrade_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBcUpgradePlatform
    with MockPlatformInterfaceMixin
    implements BcUpgradePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> cancel() {
    // TODO: implement cancel
    throw UnimplementedError();
  }

  @override
  dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<int> getVersionCode() {
    // TODO: implement getVersionCode
    throw UnimplementedError();
  }

  @override
  Future<String?> getVersionName() {
    // TODO: implement getVersionName
    throw UnimplementedError();
  }

  @override
  listener(Function callback) {
    // TODO: implement listener
    throw UnimplementedError();
  }

  @override
  Future<bool> update(UpdateModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

void main() {
  final BcUpgradePlatform initialPlatform = BcUpgradePlatform.instance;

  test('$MethodChannelBcUpgrade is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBcUpgrade>());
  });

  test('getPlatformVersion', () async {
    BcUpgrade bcUpgradePlugin = BcUpgrade();
    MockBcUpgradePlatform fakePlatform = MockBcUpgradePlatform();
    BcUpgradePlatform.instance = fakePlatform;

    expect(await BcUpgrade.getVersionName(), '42');
  });
}
