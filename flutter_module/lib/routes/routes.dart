import 'package:bc_user_module/view/login_page.dart';
import 'package:bc_user_module/view/reset_pwd_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import '../pages/app_root_page.dart';
import '../pages/search_page.dart';

class AppRouter {
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    '/': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => AppRootPage(),
      );
    },

    'main/root_page': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => AppRootPage(),
      );
    },


    'main/search_page': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => SearchPage(),
      );
    },

    'user/login_page': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => LoginPage(),
      );
    },
    'user/reset_pwd_page': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => ResetPwdPage(),
      );
    },
  };

  static Route<dynamic>? routeFactory(RouteSettings setting, String? uniqueId) {
    FlutterBoostRouteFactory? factory = routerMap[setting.name];
    if (factory == null) {
      return null;
    }
    return factory(setting, uniqueId);
  }
}
