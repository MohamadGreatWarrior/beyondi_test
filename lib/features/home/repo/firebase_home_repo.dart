part of 'home_repo.dart';

@Injectable(as: HomeRepo)
class FirebaseCarRepo implements HomeRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  final dioClient = DioClient();

  @override
  Future<List<CarModel>> get cars async {
    final response = await dioClient.get(
      FirebaseCollections.documentsCars,
    );

    final data = (response.data as Object).toMap;
    final documentsModel = DocumentsModel.fromJson(data);

    return documentsModel.documents.map(
      (e) {
        final car = CarModel.fromJson(e.fields);
        return car.copyWith(
          isMine: _firebaseAuth.currentUser?.uid == car.userId,
        );
      },
    ).toList();
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  List<CarModel> get fakeCars {
    return [
      CarModel.fake,
      CarModel.fake,
      CarModel.fake,
    ];
  }
}
