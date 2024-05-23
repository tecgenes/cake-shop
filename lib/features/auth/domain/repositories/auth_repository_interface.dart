import 'package:cake_shop/config/errors/failures.dart';
import 'package:cake_shop/features/auth/domain/entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepositoryInterface{

  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
});

  Future<Either<Failure, UserEntity>> registerWithEmailPassword({
    required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> currentUser();
}