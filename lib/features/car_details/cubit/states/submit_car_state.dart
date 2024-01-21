part of '../car_details_cubit.dart';

abstract class SubmitCarState extends GeneralCarDetailsState {}

class SubmitCarInitial extends SubmitCarState {}

class SubmitCarSuccess extends SubmitCarState {
  SubmitCarSuccess(this.car);

  final CarModel car;
}

class SubmitCarLoading extends SubmitCarState {}

class SubmitCarError extends SubmitCarState {
  SubmitCarError(this.message);

  final String message;
}
