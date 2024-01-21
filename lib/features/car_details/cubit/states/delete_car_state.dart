part of '../car_details_cubit.dart';

abstract class DeleteCarState extends GeneralCarDetailsState {}

class DeleteCarInitial extends DeleteCarState {}

class DeleteCarSuccess extends DeleteCarState {
  DeleteCarSuccess(this.wish);

  final CarModel wish;
}

class DeleteCarLoading extends DeleteCarState {}

class DeleteCarError extends DeleteCarState {
  DeleteCarError(this.message);

  final String message;
}
