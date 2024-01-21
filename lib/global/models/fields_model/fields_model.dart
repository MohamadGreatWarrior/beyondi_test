import 'package:json_annotation/json_annotation.dart';

part 'fields_model.g.dart';

@JsonSerializable()
class FieldsModel{
  const FieldsModel({
    required this.fields,
  });

  factory FieldsModel.fromJson(Map<String, dynamic> json) {
    return _$FieldsModelFromJson(json);
  }

  final Map<String, dynamic> fields;

  Map<String, dynamic> toJson() {
    return _$FieldsModelToJson(this);
  }
}
