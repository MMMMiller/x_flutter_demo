import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_boost/flutter_boost.dart';

import 'routes/routes.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  _FlutterAppState createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  @override
  void initState() {
    /// init
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(
      AppRouter.routeFactory as FlutterBoostRouteFactory,
      initialRoute: '/',
      appBuilder: (Widget home) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          child: OKToast(
            dismissOtherOnShow: true,
            backgroundColor: const Color(0xFF3A3A3A),
            position: ToastPosition.bottom,
            radius: 2,
            textPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            textStyle: const TextStyle(color: Colors.white, fontSize: 14),
            child: RefreshConfiguration(
              hideFooterWhenNotFull: true,
              headerBuilder: () => const MaterialClassicHeader(),
              footerBuilder: () => ClassicFooter(
                canLoadingText: '松手以加载更多',
                failedText: '加载失败，请点击重试',
                idleText: '上拉加载更多',
                loadingText: '加载中...',
                noDataText: '暂无更多数据',
                textStyle: TextStyle(
                  color: ColorsConfig.cccccc,
                  fontSize: 12,
                ),
              ),
              child: MaterialApp(
                home: home,
                title: 'flutter_demo_ios',
                key: GlobalKey(),
                themeMode: ThemeMode.system,
                theme: ThemeData(
                  brightness: Brightness.light,
                  scaffoldBackgroundColor: Color(0xFFFFFFFF),//Color(0xFFFFFFFF),
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: Color(0xFF000000),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
