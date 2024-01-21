import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart';
import 'package:p2p_car_renting/global/dio/dio.dart';
import 'package:p2p_car_renting/global/models/models.dart';
import 'package:p2p_car_renting/global/repos/firebase_collections.dart';

part 'firebase_car_details_repo.dart';

abstract class CarDetailsRepo {
  Future<CarModel> addCar(CarModel car);

  Future<void> editCar(CarModel wish);

  Future<void> deleteCar(CarModel wish);
}
