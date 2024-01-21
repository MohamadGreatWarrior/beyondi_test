import 'package:firebase_auth/firebase_auth.dart';
import 'package:p2p_car_renting/features/sign_in/models/user_model/user_model.dart';

extension FirebaseAuthX on User? {
  Future<UserModel> get toUser async {
    final value = this;
    final token = await this?.getIdToken();

    return value != null && token != null
        ? UserModel(id: value.uid, token: token)
        : throw "Can't authenticate";
  }
}

extension DynamicConvert on Object {
  Map<String, dynamic> get toMap {
    return this as Map<String, dynamic>;
  }

  List<dynamic> get toList {
    return this as List<dynamic>;
  }
}
