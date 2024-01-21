import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:p2p_car_renting/features/sign_in/models/user_model/user_model.dart';
import 'package:p2p_car_renting/global/repos/user_repo.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

@singleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, GeneralAuthenticationState> {
  AuthenticationBloc(this._userRepo) : super(InitialAuthState()) {
    debugPrint('CurrentState: $state');

    on<CheckIfAuthenticated>(_checkIfAuthenticated);
    on<GuestRequested>(_continueAsGuest);
    on<SignInFormRequested>(_showSignInForm);
    on<SignInRequested>(_signIn);
    on<AuthenticateBiometric>(_authenticateBiometric);
    on<SignOutRequested>(_signOut);
  }

  final UserRepo _userRepo;

  void _checkIfAuthenticated(
    CheckIfAuthenticated event,
    Emitter<GeneralAuthenticationState> emit,
  ) {
    if (_userRepo.user != null) {
      emit(BiometricsState());
    } else {
      emit(
        UnauthenticatedState(
          showSignInBackButton: event.showSignInBackButton,
        ),
      );
    }
  }

  Future<void> _continueAsGuest(
    GuestRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    await _userRepo.deleteUser();
    emit(GuestState());
  }

  void _showSignInForm(
    SignInFormRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) {
    emit(
      SignInState(
        showSignInBackButton: event.showSignInBackButton,
      ),
    );
  }

  Future<void> _authenticateBiometric(
    AuthenticateBiometric event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    if (!canAuthenticate) {
      event.onError?.call();
      return;
    }

    try {
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (availableBiometrics.isNotEmpty) {
        await auth.authenticate(
          localizedReason: Strings.pleaseAuthenticate,
          options: const AuthenticationOptions(biometricOnly: true),
        );
        emit(AuthenticatedState());
      } else {
        event.onError?.call();
      }
    } catch (e) {
      event.onError?.call();
    }
  }

  Future<void> _signIn(
    SignInRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    await _userRepo.setUser(event.signInModel);
    emit(AuthenticatedState());
  }

  Future<void> _signOut(
    SignOutRequested event,
    Emitter<GeneralAuthenticationState> emit,
  ) async {
    await _userRepo.deleteUser();
    emit(const UnauthenticatedState());
  }
}
