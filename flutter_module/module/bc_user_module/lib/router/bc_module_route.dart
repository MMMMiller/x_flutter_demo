import 'package:bc_user_module/view/change_pwd_page.dart';
import 'package:bc_user_module/view/login_page.dart';
import 'package:bc_user_module/view/reset_pwd_page.dart';
import 'package:bc_user_module/router/bc_route_name.dart';
import 'package:common_lib/service/router/router_util.dart';

/// createTime: 2022/8/24 on 15:02
/// desc:
///
/// @author azhon

class BcCustomerModuleRoute {
  static void initRoute() {
    RouterUtil.instance.addRoute(BcRouteName.loginPage, (map) {
      return const LoginPage();
    });
    RouterUtil.instance.addRoute(BcRouteName.resetPwdPage, (map) {
      return const ResetPwdPage();
    });
    RouterUtil.instance.addRoute(BcRouteName.changePwdPage, (map) {
      return const ChangePwdPage();
    });
  }
}
