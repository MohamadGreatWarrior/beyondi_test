part of '../car_details_cubit.dart';

class TextFieldState extends GeneralCarDetailsState {
  TextFieldState(this.type, {this.error});

  final String? error;

  final AddCarFieldType type;
}

enum AddCarFieldType {
  make,
  model,
  price,
  location,
  isAvailable,
}
