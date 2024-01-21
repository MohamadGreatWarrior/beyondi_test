part of '../sign_in_cubit.dart';

abstract class EmailState extends GeneralSignInState {}

class EmailChanged extends EmailState {}

class EmailReset extends EmailState {}

class EmailError extends EmailState {
  EmailError(this.message);

  final String message;
}
