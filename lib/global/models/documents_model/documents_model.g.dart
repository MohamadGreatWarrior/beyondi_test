// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentsModel _$DocumentsModelFromJson(Map<String, dynamic> json) =>
    DocumentsModel(
      documents: (json['documents'] as List<dynamic>)
          .map((e) => FieldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocumentsModelToJson(DocumentsModel instance) =>
    <String, dynamic>{
      'documents': instance.documents,
    };
