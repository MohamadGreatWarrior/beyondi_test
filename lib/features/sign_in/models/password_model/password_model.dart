import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable()
@CopyWith(skipFields: true)
@immutable
class PasswordModel {
  const PasswordModel({required this.password});

  static PasswordModel empty = const PasswordModel(password: '');

  final String password;

  String? validatePassword() {
    if (password.isEmpty) {
      return "Password can't be empty";
    }

    if (password.length < 8) {
      return 'Password should be at least 8 characters';
    }

    int uppercaseCount = 0;
    int lowercaseCount = 0;
    int specialCharCount = 0;
    int numberCount = 0;

    const uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    const specialCharacters = '!@#\$%^&*()-_=+[{]}|;:,<.>/';
    const numbers = '0123456789';

    for (int i = 0; i < password.length; i++) {
      final String char = password[i];

      if (uppercaseLetters.contains(char)) {
        uppercaseCount++;
      } else if (lowercaseLetters.contains(char)) {
        lowercaseCount++;
      } else if (specialCharacters.contains(char)) {
        specialCharCount++;
      } else if (numbers.contains(char)) {
        numberCount++;
      }
    }

    if (uppercaseCount <= 0) {
      return 'Password should contain at least one uppercase letter';
    }

    if (lowercaseCount <= 0) {
      return 'Password should contain at least one lowercase letter';
    }

    const requiredSpecial = 2;
    if (specialCharCount < requiredSpecial) {
      return 'Password should contain at least $requiredSpecial special letters';
    }

    const requiredNumbers = 3;
    if (numberCount < requiredNumbers) {
      return 'Password should contain at least $requiredNumbers numbers';
    }

    return null;
  }
}
