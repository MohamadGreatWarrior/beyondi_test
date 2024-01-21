part of '../home_cubit.dart';

@immutable
abstract class HomeState extends GeneralHomeState {}

class HomeInitial extends HomeState {}

class HomeFetch extends HomeState {
  HomeFetch(this.cars);

  final List<CarModel> cars;
}

class HomeLoading extends HomeFetch {
  HomeLoading(super.cars);
}

class HomeSuccess extends HomeFetch {
  HomeSuccess(super.cars);
}

class HomeError extends HomeState {
  HomeError(this.message);

  final String message;
}
