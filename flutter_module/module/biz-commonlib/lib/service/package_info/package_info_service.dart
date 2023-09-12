import 'dart:io';

import 'package:common_lib/index.dart';

///文件名:    device_info_service
///创建时间:  2022/10/28 on 16:59
///描述:
///
///@author   xueml

PackInfoService packInfoService = PackInfoService();

class PackInfoService {
  PackageInfo? packageInfo;

  Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  String? get version => packageInfo?.version;

  String? get buildNumber => packageInfo?.buildNumber;

  int get realBuildNumber =>int.parse((packageInfo?.buildNumber ?? '').replaceAll('.', ''));

  String? get packageName => packageInfo?.packageName;
}
