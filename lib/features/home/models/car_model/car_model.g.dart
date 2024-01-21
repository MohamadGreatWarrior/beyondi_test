// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CarModelCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CarModel call({
    String? id,
    String? userId,
    String? make,
    String? model,
    double? price,
    String? location,
    bool? isAvailable,
    bool? isMine,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCarModel.copyWith(...)`.
class _$CarModelCWProxyImpl implements _$CarModelCWProxy {
  const _$CarModelCWProxyImpl(this._value);

  final CarModel _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// CarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CarModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? make = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? isAvailable = const $CopyWithPlaceholder(),
    Object? isMine = const $CopyWithPlaceholder(),
  }) {
    return CarModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      make: make == const $CopyWithPlaceholder() || make == null
          ? _value.make
          // ignore: cast_nullable_to_non_nullable
          : make as String,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double,
      location: location == const $CopyWithPlaceholder() || location == null
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String,
      isAvailable:
          isAvailable == const $CopyWithPlaceholder() || isAvailable == null
              ? _value.isAvailable
              // ignore: cast_nullable_to_non_nullable
              : isAvailable as bool,
      isMine: isMine == const $CopyWithPlaceholder() || isMine == null
          ? _value.isMine
          // ignore: cast_nullable_to_non_nullable
          : isMine as bool,
    );
  }
}

extension $CarModelCopyWith on CarModel {
  /// Returns a callable class that can be used as follows: `instanceOfCarModel.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$CarModelCWProxy get copyWith => _$CarModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModel _$CarModelFromJson(Map<String, dynamic> json) => CarModel(
      id: const StringValueConverter()
          .fromJson(json['id'] as Map<String, dynamic>),
      userId: json['user_id'] == null
          ? ''
          : const StringValueConverter()
              .fromJson(json['user_id'] as Map<String, dynamic>),
      make: const StringValueConverter()
          .fromJson(json['make'] as Map<String, dynamic>),
      model: const StringValueConverter()
          .fromJson(json['model'] as Map<String, dynamic>),
      price: const DoubleValueConverter()
          .fromJson(json['price'] as Map<String, dynamic>),
      location: const StringValueConverter()
          .fromJson(json['location'] as Map<String, dynamic>),
      isAvailable: json['is_available'] == null
          ? false
          : const BoolValueConverter()
              .fromJson(json['is_available'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      'id': const StringValueConverter().toJson(instance.id),
      'user_id': const StringValueConverter().toJson(instance.userId),
      'make': const StringValueConverter().toJson(instance.make),
      'model': const StringValueConverter().toJson(instance.model),
      'price': const DoubleValueConverter().toJson(instance.price),
      'location': const StringValueConverter().toJson(instance.location),
      'is_available': const BoolValueConverter().toJson(instance.isAvailable),
    };
