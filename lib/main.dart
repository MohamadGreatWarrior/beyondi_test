import 'package:p2p_car_renting/features/app/view/pcr_app.dart';
import 'package:p2p_car_renting/global/di/di.dart';
import 'package:p2p_car_renting/global/utils/run_app_with_reporting.dart';
import 'package:p2p_car_renting/global/utils/utils.dart';

void main() {
  runAppWithReporting(
    const PcrApp(),
    preLaunch: configureDependencies,
  );
}
