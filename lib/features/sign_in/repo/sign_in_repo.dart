import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/features/sign_in/models/user_model/user_model.dart';
import 'package:p2p_car_renting/global/extensions/firebase_auth_x.dart';

part 'firebase_sign_in_repo.dart';
part 'sign_in_exceptions.dart';

abstract class SignInRepo {
  Stream<UserModel> get user;

  Future<UserModel> signIn({required String email, required String password});

  Future<UserModel> signUp({required String email, required String password});
}
