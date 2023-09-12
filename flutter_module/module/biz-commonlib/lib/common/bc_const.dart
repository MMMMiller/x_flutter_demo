import 'package:common_lib/index.dart';
import 'package:common_lib/service/package_info/package_info_service.dart';


// PackInfoService packInfoService = PackInfoService();
class BCConst {
  BCConst._internal();
  static BCConst get instance => _getInstance();
  static BCConst? _instance;
  static BCConst _getInstance() {
    _instance ??= BCConst._internal();
    return _instance!;
  }

  //
  // factory ApplicationService() => _getInstance();
  //
  // ApplicationService._internal();
  //
  // static ApplicationService get instance => _getInstance();
  // static ApplicationService? _instance;
  // StreamSubscription? sub;
  //
  // static ApplicationService _getInstance() {
  //   _instance ??= ApplicationService._internal();
  //   return _instance!;
  // }



  //key value 不一致是为了迷惑苹果审核 因为本地存储数据可能会被查到
  // static const String applePayStatus = 'asxcvsdzxcv';
  // packInfoService
    String applePayStatus = '${packInfoService.version}_${packInfoService.buildNumber}';
    String applePayOpen = 'asxcvsdzxcvfds'; // 打开苹果支付
    String applePayClose = 'asxcvsdzxcvv'; //  关闭苹果支付
}