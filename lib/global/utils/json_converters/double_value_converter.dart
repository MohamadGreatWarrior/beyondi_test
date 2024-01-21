import 'package:json_annotation/json_annotation.dart';

class DoubleValueConverter
    implements JsonConverter<double, Map<String, dynamic>> {
  const DoubleValueConverter();

  @override
  double fromJson(Map<String, dynamic> json) =>
      double.parse(json.values.first.toString());

  @override
  Map<String, dynamic> toJson(double object) => {'doubleValue': object};
}
