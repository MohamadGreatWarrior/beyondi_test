import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_car_renting/global/router/app_auto_route_observer.dart';
import 'package:p2p_car_renting/global/router/router.dart';
import 'package:p2p_car_renting/global/theme/light_theme.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';
import 'package:p2p_car_renting/global/widgets/clear_focus_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PcrMaterialApp extends StatefulWidget {
  const PcrMaterialApp({super.key});

  @override
  State<PcrMaterialApp> createState() => _PcrMaterialAppState();
}

class _PcrMaterialAppState extends State<PcrMaterialApp> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ClearFocusWidget(
      child: ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, child) {
          return SkeletonizerConfig(
            data: const SkeletonizerConfigData(
              ignoreContainers: true,
            ),
            child: MaterialApp.router(
              onGenerateTitle: (context) => Strings.appName,
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(
                rebuildStackOnDeepLink: true,
                includePrefixMatches: true,
                navigatorObservers: () => [
                  AppAutoRouteObserver(),
                  HeroController(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
