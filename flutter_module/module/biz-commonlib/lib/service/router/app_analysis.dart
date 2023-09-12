import 'package:flutter/material.dart';
import 'package:common_lib/service/router/router_history_service.dart';

class AppAnalysis extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      RouterHistoryService.instance.push(route.settings.name ?? '');
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute?.settings.name != null) {
      RouterHistoryService.instance.replace(
        newRoute?.settings.name ?? '',
        oldRoute?.settings.name ?? '',
      );
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      RouterHistoryService.instance.pop(route.settings.name ?? '');
    }
  }
}
