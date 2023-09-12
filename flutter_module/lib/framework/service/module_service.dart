
import 'package:common_lib/base/index.dart';
import 'package:common_lib/main.dart';
import 'package:flutter_module/pages/user/main.dart';


///文件名:    module_service
///创建时间:  2022/8/25 on 20:43
///描述:
///
///@author   xueml

class ModuleService {
  static void init() {
    // CmsModule().register();
    UserModule().register();
    // MessageModule().register();
    BizCommonModule().register();
    // ServicePackModule().register();
    // PayModule().register();
    // BCWebModule().register();
  }

  static IUserModuleProvider get userModuleProvider =>
      ModuleManager.getM<UserModule>().iModuleProvider as IUserModuleProvider;
}
