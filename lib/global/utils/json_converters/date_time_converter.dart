import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String?> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String? json) {
    if (json == null) return DateTime.now();
    return DateTime.parse(json);
  }

  @override
  String? toJson(DateTime date) => date.toIso8601String();
}
