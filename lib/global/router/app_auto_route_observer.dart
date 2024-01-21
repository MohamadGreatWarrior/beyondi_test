// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:p2p_car_renting/global/utils/utils.dart';

class AppAutoRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // logger.d(
    //     'Previous route: ${previousRoute?.settings.name}\nPushed route: ${route.settings.name}',
    // );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // logger.w(
    //   'Popped route: ${route.settings.name}\nPrevious route: ${previousRoute?.settings.name}',
    // );
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    // debugPrint('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    // debugPrint('Tab route re-visited: ${route.name}');
  }
}
