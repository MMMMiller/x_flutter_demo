import 'package:flutter/material.dart';
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
    return FlutterBoostApp(AppRouter.routeFactory, initialRoute: '/',
        appBuilder: (Widget home) {
      return home;
    });
  }
}
