import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/features/home/models/car_model/car_model.dart';
import 'package:p2p_car_renting/global/dio/dio.dart';
import 'package:p2p_car_renting/global/extensions/firebase_auth_x.dart';
import 'package:p2p_car_renting/global/models/documents_model/documents_model.dart';
import 'package:p2p_car_renting/global/repos/firebase_collections.dart';

part 'firebase_home_repo.dart';

abstract class HomeRepo {
  Future<List<CarModel>> get cars;

  Future<void> signOut();

  List<CarModel> get fakeCars;
}
