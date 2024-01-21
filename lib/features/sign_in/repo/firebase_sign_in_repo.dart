part of 'sign_in_repo.dart';

@Injectable(as: SignInRepo)
class FirebaseSignInRepo implements SignInRepo {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().asyncMap(
      (firebaseUser) async {
        final user = await firebaseUser.toUser;
        return user;
      },
    );
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return response.user.toUser;
    } on FirebaseAuthException catch (e) {
      throw SignInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response.user.toUser;
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }
}
