part of '../sign_in_cubit.dart';

abstract class SignInState extends GeneralSignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {
  SignInSuccess(this.userModel);

  final UserModel userModel;
}

class SignInLoading extends SignInState {}

class SignInError extends SignInState {
  SignInError(this.message);

  final String message;
}
