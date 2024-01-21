import 'dart:async';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart';
import 'package:p2p_car_renting/features/home/repo/home_repo.dart';
import 'package:p2p_car_renting/global/dio/dio.dart';
import 'package:p2p_car_renting/global/repos/repos.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';

part 'states/general_home_state.dart';

part 'states/home_state.dart';

part 'states/sign_out_state.dart';

part 'states/unauthorized_state.dart';

@injectable
class HomeCubit extends Cubit<GeneralHomeState> {
  HomeCubit(
    this._userRepo,
    this._homeRepo,
  ) : super(HomeInitial());

  final UserRepo _userRepo;

  final HomeRepo _homeRepo;

  List<CarModel> cars = [];

  Future<void> getCars() async {
    emit(HomeLoading(_homeRepo.fakeCars));

    try {
      final response = await _homeRepo.cars;

      cars = response;
      emit(HomeSuccess(response));
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      if (e is UnauthorizedException) {
        emit(UnauthorizedState());
      } else {
        emit(HomeError(Strings.wentWrongSwipe));
      }
    }
  }

  void onAddCar({VoidCallback? onSuccess, VoidCallback? onFail}) {
    if (!_userRepo.isSignedIn) {
      onFail?.call();
      return;
    }

    onSuccess?.call();
  }

  void addCar(CarModel car) {
    if (cars.contains(car)) {
      cars[cars.indexWhere((element) => element == car)] = car;
    } else {
      cars = [car, ...cars];
    }
    emit(HomeSuccess(cars));
  }

  void deleteCar(CarModel car) {
    cars.remove(car);
    emit(HomeSuccess(cars));
  }

  Future<void> signOut() async {
    emit(SignOutLoading());

    try {
      await _homeRepo.signOut();

      emit(SignOutSuccess());
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(SignOutError(e.toString()));
    }
  }
}
