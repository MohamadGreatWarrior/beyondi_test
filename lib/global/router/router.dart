import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:p2p_car_renting/features/authentication/view/authentication_view.dart';
import 'package:p2p_car_renting/features/authentication/view/biometrics_view.dart';
import 'package:p2p_car_renting/features/car_details/view/car_details_view.dart';
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart';
import 'package:p2p_car_renting/features/home/view/home_view.dart';
import 'package:p2p_car_renting/features/main_navigation/view/main_navigation_view.dart';
import 'package:p2p_car_renting/features/sign_in/view/sign_in_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Tab|Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes {
    return [
      CustomRoute(
        initial: true,
        page: AuthenticationRoute.page,
        transitionsBuilder: TransitionsBuilders.noTransition,
        children: [
          AutoRoute(
            page: SignInRoute.page,
          ),
          AutoRoute(
            page: BiometricsRoute.page,
          ),
          AutoRoute(
            page: MainNavigationRoute.page,
            children: [
              AutoRoute(
                initial: true,
                page: HomeRoute.page,
              ),
              AutoRoute(
                page: CarDetailsRoute.page,
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
