import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_car_renting/global/utils/logger.dart';

class PcrBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.f(
      '${bloc.runtimeType}:\n$event',
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.i(
      '${bloc.runtimeType}:\n${change.currentState}\n${change.nextState}',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('$error\n$stackTrace');
  }
}
