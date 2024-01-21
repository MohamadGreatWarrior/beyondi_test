import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/features/car_details/repo/car_details_repo.dart';
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart';

part 'states/submit_car_state.dart';

part 'states/delete_car_state.dart';

part 'states/general_car_details_state.dart';

part 'states/is_editing_car_state.dart';

part 'states/text_field_changed_state.dart';

@injectable
class CarDetailsCubit extends Cubit<GeneralCarDetailsState> {
  CarDetailsCubit(
    this._carDetailsRepo,
    @factoryParam this.car,
  ) : super(CarDetailsInitial());

  final CarDetailsRepo _carDetailsRepo;

  CarModel car;

  bool isEditing = false;

  void checkIfEditing() {
    final isGood = car.validate();
    isEditing = isGood;
    emit(
      IsEditingCarState(isEditing: isEditing, isMine: !isGood || car.isMine),
    );
  }

  void editMake(String input) {
    car = car.copyWith(make: input);
    emit(TextFieldState(AddCarFieldType.make));
  }

  void editModel(String input) {
    car = car.copyWith(model: input);
    emit(TextFieldState(AddCarFieldType.model));
  }

  void editPrice(String input) {
    final price = double.tryParse(input);

    if (price == null) {
      emit(TextFieldState(AddCarFieldType.price));
      return;
    }

    car = car.copyWith(price: price);
    emit(TextFieldState(AddCarFieldType.price));
  }

  void editLocation(String input) {
    car = car.copyWith(location: input);
    emit(TextFieldState(AddCarFieldType.location));
  }

  void editIsAvailable(bool isAvailable) {
    car = car.copyWith(isAvailable: isAvailable);
    emit(TextFieldState(AddCarFieldType.isAvailable));
  }

  Future<void> submitCar({
    required bool isEdit,
    ValueSetter<CarModel>? onSuccess,
  }) async {
    if (!_validate(car)) {
      return;
    }

    emit(SubmitCarLoading());

    try {
      if (isEdit) {
        await _carDetailsRepo.editCar(car);
      } else {
        car = await _carDetailsRepo.addCar(car);
      }

      onSuccess?.call(car);
      emit(SubmitCarSuccess(car));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(SubmitCarError(e.toString()));
    }
  }

  bool _validate(CarModel car) {
    return car.validate(
      onMakeError: (e) => emit(TextFieldState(AddCarFieldType.make, error: e)),
      onModelError: (e) =>
          emit(TextFieldState(AddCarFieldType.model, error: e)),
      onPriceError: (e) =>
          emit(TextFieldState(AddCarFieldType.price, error: e)),
      onLocationError: (e) =>
          emit(TextFieldState(AddCarFieldType.location, error: e)),
    );
  }

  Future<void> deleteCar({ValueSetter<CarModel>? onSuccess}) async {
    if (!_validate(car) || !car.isMine) {
      return;
    }

    emit(DeleteCarLoading());

    try {
      await _carDetailsRepo.deleteCar(car);

      onSuccess?.call(car);
      emit(DeleteCarSuccess(car));
    } catch (e, stackTrace) {
      addError(e, stackTrace);
      emit(DeleteCarError(e.toString()));
    }
  }
}
