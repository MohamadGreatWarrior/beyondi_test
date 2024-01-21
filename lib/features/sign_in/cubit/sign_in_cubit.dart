import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/features/sign_in/models/email_model/email_model.dart';
import 'package:p2p_car_renting/features/sign_in/models/password_model/password_model.dart';
import 'package:p2p_car_renting/features/sign_in/models/user_model/user_model.dart';
import 'package:p2p_car_renting/features/sign_in/repo/sign_in_repo.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';

part 'states/email_state.dart';

part 'states/general_sign_in_state.dart';

part 'states/password_state.dart';

part 'states/sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<GeneralSignInState> {
  SignInCubit(
    this._signInRepo,
  ) : super(SignInInitial());

  final SignInRepo _signInRepo;

  EmailModel emailModel = EmailModel.empty;

  PasswordModel passwordModel = PasswordModel.empty;

  void addEmail(String input) {
    emailModel = EmailModel(email: input);
    emit(EmailChanged());
  }

  void addPassword(String input) {
    passwordModel = PasswordModel(password: input);
    emit(PasswordChanged());
  }

  Future<void> signIn({
    VoidCallback? onLoading,
    VoidCallback? onSuccess,
  }) async {
    if (!_validate()) {
      return;
    }

    onLoading?.call();
    emit(SignInLoading());

    try {
      final response = await _signInRepo.signIn(
        email: emailModel.email,
        password: passwordModel.password,
      );

      onSuccess?.call();

      emit(SignInSuccess(response));
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      if (e is SignInWithEmailAndPasswordFailure) {
        emit(SignInError(e.message));
        return;
      } else {
        emit(SignInError(Strings.wentWrong));
      }
    }
  }

  Future<void> signUp({
    VoidCallback? onLoading,
    VoidCallback? onSuccess,
  }) async {
    if (!_validate()) {
      return;
    }

    onLoading?.call();

    onLoading?.call();
    emit(SignInLoading());

    try {
      final response = await _signInRepo.signUp(
        email: emailModel.email,
        password: passwordModel.password,
      );

      onSuccess?.call();

      emit(SignInSuccess(response));
    } catch (e, stackTrace) {
      addError(e, stackTrace);

      if (e is SignUpWithEmailAndPasswordFailure) {
        emit(SignInError(e.message));
        return;
      } else {
        emit(SignInError(Strings.wentWrong));
      }
    }
  }

  void resetEmail() {
    emailModel = EmailModel.empty;
    emit(EmailReset());
  }

  void resetPassword() {
    passwordModel = PasswordModel.empty;
    emit(PasswordReset());
  }

  void resetAll() {
    resetEmail();
    resetPassword();
  }

  bool _validate() {
    bool isGood = true;

    final eError = emailModel.validateEmail();
    if (eError != null) {
      emit(EmailError(eError));
      isGood = false;
    }

    final pError = passwordModel.validatePassword();
    if (pError != null) {
      emit(PasswordError(pError));
      isGood = false;
    }

    return isGood;
  }
}
