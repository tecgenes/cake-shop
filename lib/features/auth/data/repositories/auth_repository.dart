import 'package:cake_shop/core/contracts/auth_remote_datasource.dart';
import 'package:cake_shop/core/errors/exceptions.dart';
import 'package:cake_shop/core/errors/failures.dart';
import 'package:cake_shop/features/auth/domain/entities/user_entity.dart';
import 'package:cake_shop/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository implements AuthRepositoryInterface {
  final AuthRemoteDatasourceInterface remoteDatasource;

  AuthRepository(this.remoteDatasource);

  @override
  Future<Either<Failure, UserEntity>> currentUser() async {
    try{
      final user = await remoteDatasource.getCurrentUserData();
      if(user != null){
        return right(user);
      }
      return left(Failure('User not logged in !'));
    } on ServerException catch(error){
      return left(Failure(error.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDatasource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmailPassword({
    required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDatasource.registerWithEmailPassword(
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, UserEntity>> _getUser(
    Future<UserEntity> Function() function,
  ) async {
    try {
      final user = await function();
      return right(user);
    } on AuthException catch (error){
      return left(Failure(error.message));
    } on ServerException catch (error) {
      return left(Failure(error.message));
    }
  }
}
