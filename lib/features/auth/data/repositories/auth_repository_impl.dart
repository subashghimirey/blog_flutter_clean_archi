
import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword(
      {required String name, required String email, required String password}) async {
      
      try{
        final userId = await remoteDataSource.signUpWithEmailPassword(name: name, email: email, password: password);
        return right(userId);
      }
      on ServerException catch (err){
        return left(Failure(err.message));
      }


  }

  @override
  Future<Either<Failure, String>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }
}
