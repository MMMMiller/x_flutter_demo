
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/app_root_page.dart';
import 'package:flutter_module/module/cms/page/cms_page.dart';
import 'package:flutter_module/module/user/page/login_page.dart';
import 'package:flutter_module/module/user/page/reset_pwd_page.dart';

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


    'main/cms_page': (settings, uniqueId) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (_) => CMSPage(),
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
