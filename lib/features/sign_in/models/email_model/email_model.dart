import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:email_validator/email_validator.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable()
@CopyWith(skipFields: true)
@immutable
class EmailModel {
  const EmailModel({required this.email});

  static EmailModel empty = const EmailModel(email: '');

  final String email;

  String? validateEmail() {
    if (email.isEmpty) {
      return "Email can't be empty";
    }

    final result = EmailValidator.validate(email);

    return result ? null : "Email isn't valid";
  }
}
