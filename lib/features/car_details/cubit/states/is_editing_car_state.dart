part of '../car_details_cubit.dart';

class IsEditingCarState extends GeneralCarDetailsState {
  IsEditingCarState({
    required this.isEditing,
    required this.isMine,
  });

  final bool isEditing;
  final bool isMine;
}
