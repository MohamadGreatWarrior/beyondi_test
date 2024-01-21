import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:p2p_car_renting/global/utils/json_converters/bool_value_converter.dart';
import 'package:p2p_car_renting/global/utils/json_converters/double_value_converter.dart';
import 'package:p2p_car_renting/global/utils/json_converters/string_value_converter.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';

part 'car_model.g.dart';

@JsonSerializable()
@CopyWith(skipFields: true)
@immutable
class CarModel extends Equatable {
  const CarModel({
    required this.id,
    required this.userId,
    required this.make,
    required this.model,
    required this.price,
    required this.location,
    required this.isAvailable,
    this.isMine = false,
  });

  factory CarModel.fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>?;
    if (data == null) throw Strings.dataNull;

    return CarModel.fromJson(data);
  }

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);

  static const empty = CarModel(
    id: '',
    userId: '',
    make: '',
    model: '',
    price: 00,
    location: '',
    isAvailable: true,
    isMine: true,
  );

  @JsonKey(name: "id")
  @StringValueConverter()
  final String id;

  @JsonKey(name: "user_id", defaultValue: '')
  @StringValueConverter()
  final String userId;

  @JsonKey(
    includeFromJson: false,
    includeToJson: false,
  )
  final bool isMine;

  @JsonKey(name: "make")
  @StringValueConverter()
  final String make;

  @JsonKey(name: "model")
  @StringValueConverter()
  final String model;

  @JsonKey(name: "price")
  @DoubleValueConverter()
  final double price;

  @JsonKey(name: "location")
  @StringValueConverter()
  final String location;

  @JsonKey(name: "is_available", defaultValue: false)
  @BoolValueConverter()
  final bool isAvailable;

  Map<String, dynamic> toJson() => _$CarModelToJson(this);

  @override
  List<Object?> get props => [id];

  bool validate({
    ValueSetter<String>? onMakeError,
    ValueSetter<String>? onModelError,
    ValueSetter<String>? onPriceError,
    ValueSetter<String>? onLocationError,
  }) {
    bool isGood = true;

    if (make.isEmpty) {
      onMakeError?.call("make can't be empty");
      isGood = false;
    }

    if (model.isEmpty) {
      onModelError?.call("model can't be empty");
      isGood = false;
    }

    if (price <= 0.0) {
      onPriceError?.call("price should higher than 0");
      isGood = false;
    }

    if (location.isEmpty) {
      onLocationError?.call("location can't be empty");
      isGood = false;
    }

    return isGood;
  }

  static const fake = CarModel(
    id: 'id',
    userId: 'userId',
    make: 'make make',
    model: 'make make',
    price: 000000,
    location: 'make make',
    isAvailable: false,
  );
}
