import 'dart:convert';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_model.g.dart';

@JsonSerializable()
@CopyWith()
@immutable
class UserModel {
  const UserModel({
    required this.id,
    required this.token,
  });

  factory UserModel.fromJsonStr(String str) =>
      UserModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static const empty = UserModel(id: '', token: '');

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "token")
  final String token;

  String toJsonStr() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
