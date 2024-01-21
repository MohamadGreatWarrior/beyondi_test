// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationView(),
      );
    },
    BiometricsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BiometricsView(),
      );
    },
    CarDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CarDetailsRouteArgs>(
          orElse: () => const CarDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CarDetailsView(
          key: args.key,
          car: args.car,
          onSubmit: args.onSubmit,
          onDelete: args.onDelete,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainNavigationView(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInView(
          key: args.key,
          reduceSpace: args.reduceSpace,
          showBackButton: args.showBackButton,
          showContinueAsGuest: args.showContinueAsGuest,
          onSignedIn: args.onSignedIn,
        ),
      );
    },
  };
}

/// generated route for
/// [AuthenticationView]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BiometricsView]
class BiometricsRoute extends PageRouteInfo<void> {
  const BiometricsRoute({List<PageRouteInfo>? children})
      : super(
          BiometricsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BiometricsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CarDetailsView]
class CarDetailsRoute extends PageRouteInfo<CarDetailsRouteArgs> {
  CarDetailsRoute({
    Key? key,
    CarModel car = CarModel.empty,
    void Function(CarModel)? onSubmit,
    void Function(CarModel)? onDelete,
    List<PageRouteInfo>? children,
  }) : super(
          CarDetailsRoute.name,
          args: CarDetailsRouteArgs(
            key: key,
            car: car,
            onSubmit: onSubmit,
            onDelete: onDelete,
          ),
          initialChildren: children,
        );

  static const String name = 'CarDetailsRoute';

  static const PageInfo<CarDetailsRouteArgs> page =
      PageInfo<CarDetailsRouteArgs>(name);
}

class CarDetailsRouteArgs {
  const CarDetailsRouteArgs({
    this.key,
    this.car = CarModel.empty,
    this.onSubmit,
    this.onDelete,
  });

  final Key? key;

  final CarModel car;

  final void Function(CarModel)? onSubmit;

  final void Function(CarModel)? onDelete;

  @override
  String toString() {
    return 'CarDetailsRouteArgs{key: $key, car: $car, onSubmit: $onSubmit, onDelete: $onDelete}';
  }
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationView]
class MainNavigationRoute extends PageRouteInfo<void> {
  const MainNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MainNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInView]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    bool reduceSpace = false,
    bool showBackButton = false,
    bool showContinueAsGuest = true,
    void Function()? onSignedIn,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(
            key: key,
            reduceSpace: reduceSpace,
            showBackButton: showBackButton,
            showContinueAsGuest: showContinueAsGuest,
            onSignedIn: onSignedIn,
          ),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<SignInRouteArgs> page = PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({
    this.key,
    this.reduceSpace = false,
    this.showBackButton = false,
    this.showContinueAsGuest = true,
    this.onSignedIn,
  });

  final Key? key;

  final bool reduceSpace;

  final bool showBackButton;

  final bool showContinueAsGuest;

  final void Function()? onSignedIn;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, reduceSpace: $reduceSpace, showBackButton: $showBackButton, showContinueAsGuest: $showContinueAsGuest, onSignedIn: $onSignedIn}';
  }
}
