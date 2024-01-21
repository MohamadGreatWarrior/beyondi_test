part of 'authentication_bloc.dart';

abstract class GeneralAuthenticationState extends Equatable {
  const GeneralAuthenticationState();

  @override
  List<Object> get props => [];
}

class InitialAuthState extends GeneralAuthenticationState {}

class GuestState extends GeneralAuthenticationState {}

class SignInState extends GeneralAuthenticationState {
  const SignInState({
    this.showSignInBackButton = false,
  });

  final bool showSignInBackButton;
}

class BiometricsState extends GeneralAuthenticationState {}

class AuthenticatedState extends GeneralAuthenticationState {}

class UnauthenticatedState extends GeneralAuthenticationState {
  const UnauthenticatedState({
    this.showSignInBackButton = false,
  });

  final bool showSignInBackButton;
}
