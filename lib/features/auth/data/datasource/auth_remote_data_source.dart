import 'package:blog_app/core/error/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword(
      {required String name, required String email, required String password});

  Future<String?> loginwithEmailPassword(
      {required String email, required String password});
}

class AuthFirebaseDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<String> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user == null) {
        throw ServerException("User is null");
      }

      final User user = userCredential.user!;
      user.updateDisplayName(name);

      return user.uid;
    } catch (err) {
      throw ServerException(err.toString());
    }
  }

  @override
  Future<String> loginwithEmailPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }
}
