part of 'car_details_repo.dart';

@Injectable(as: CarDetailsRepo)
class FirebaseCarDetailsRepo implements CarDetailsRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  final carsCollection = FirebaseFirestore.instance.collection(
    FirebaseCollections.cars,
  );

  final dioClient = DioClient();

  @override
  Future<CarModel> addCar(CarModel car) async {
    final newDoc = carsCollection.doc();
    final newCar =
        car.copyWith(id: newDoc.id, userId: _firebaseAuth.currentUser?.uid);

    await dioClient.post(
      FirebaseCollections.documentsCars,
      queryParameters: {
        'documentId': newCar.id,
      },
      data: FieldsModel(fields: newCar.toJson()).toJson(),
    );

    return newCar;
  }

  @override
  Future<void> editCar(CarModel car) async {
    await dioClient.patch(
      '${FirebaseCollections.documentsCars}/${car.id}',
      data: FieldsModel(fields: car.toJson()).toJson(),
    );
  }

  @override
  Future<void> deleteCar(CarModel car) async {
    await carsCollection.doc(car.id).delete();
  }
}
