part of '../sign_in_cubit.dart';

abstract class PasswordState extends GeneralSignInState {}

class PasswordChanged extends PasswordState {}

class PasswordReset extends PasswordState {}

class PasswordError extends PasswordState {
  PasswordError(this.message);

  final String message;
}
