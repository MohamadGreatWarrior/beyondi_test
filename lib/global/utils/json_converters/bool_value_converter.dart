import 'package:json_annotation/json_annotation.dart';

class BoolValueConverter implements JsonConverter<bool, Map<String, dynamic>> {
  const BoolValueConverter();

  @override
  bool fromJson(Map<String, dynamic> json) => json.values.first as bool;

  @override
  Map<String, dynamic> toJson(bool object) => {'booleanValue': object};
}
