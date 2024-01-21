import 'package:json_annotation/json_annotation.dart';

class StringValueConverter
    implements JsonConverter<String, Map<String, dynamic>> {
  const StringValueConverter();

  @override
  String fromJson(Map<String, dynamic> json) => json.values.first.toString();

  @override
  Map<String, String> toJson(String object) => {'stringValue': object};
}
