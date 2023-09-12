import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bc_upgrade/bc_upgrade_method_channel.dart';

void main() {
  MethodChannelBcUpgrade platform = MethodChannelBcUpgrade();
  const MethodChannel channel = MethodChannel('bc_upgrade');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getVersionName(), '42');
  });
}
