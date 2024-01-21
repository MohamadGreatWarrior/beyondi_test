part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CheckIfAuthenticated extends AuthenticationEvent {
  const CheckIfAuthenticated({
    this.showSignInBackButton = false,
  });

  final bool showSignInBackButton;
}

class SignUpRequested extends AuthenticationEvent {
  const SignUpRequested(this.signInModel);

  final UserModel signInModel;
}

class AuthenticateBiometric extends AuthenticationEvent {
  const AuthenticateBiometric({this.onError});

  final VoidCallback? onError;
}

class SignInFormRequested extends AuthenticationEvent {
  const SignInFormRequested({
    this.showSignInBackButton = false,
  });

  final bool showSignInBackButton;
}

class SignInRequested extends AuthenticationEvent {
  const SignInRequested(this.signInModel);

  final UserModel signInModel;

  @override
  List<Object> get props => [signInModel];
}

class GuestRequested extends AuthenticationEvent {}

class SignOutRequested extends AuthenticationEvent {}
