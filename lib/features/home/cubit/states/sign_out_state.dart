part of '../home_cubit.dart';

abstract class SignOutState extends GeneralHomeState {}

class SignOutInitial extends SignOutState {}

class SignOutSuccess extends SignOutState {}

class SignOutLoading extends SignOutState {}

class SignOutError extends SignOutState {
  SignOutError(this.message);

  final String message;
}
