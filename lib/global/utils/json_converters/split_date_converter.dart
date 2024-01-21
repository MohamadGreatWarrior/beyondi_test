import 'package:json_annotation/json_annotation.dart';

class SplitDateConverter implements JsonConverter<String, String?> {
  const SplitDateConverter();

  @override
  String fromJson(String? json) {
    if (json == null) return '';

    return json.split(' ')[1];
  }

  @override
  String? toJson(String object) => object;
}
