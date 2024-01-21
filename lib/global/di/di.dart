import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/global/di/di.config.dart';

final get = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => get.init();
