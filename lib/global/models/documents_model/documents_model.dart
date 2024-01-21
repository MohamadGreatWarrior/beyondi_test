import 'package:json_annotation/json_annotation.dart';
import 'package:p2p_car_renting/global/models/fields_model/fields_model.dart';

part 'documents_model.g.dart';

@JsonSerializable()
class DocumentsModel {
  const DocumentsModel({
    required this.documents,
  });

  factory DocumentsModel.fromJson(Map<String, dynamic> json) {
    return _$DocumentsModelFromJson(json);
  }

  @JsonKey(name: "documents")
  final List<FieldsModel> documents;

  Map<String, dynamic> toJson() {
    return _$DocumentsModelToJson(this);
  }
}
