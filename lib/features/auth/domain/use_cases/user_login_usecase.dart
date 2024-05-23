import 'package:cake_shop/config/contracts/usecase.dart';
import 'package:cake_shop/config/errors/failures.dart';
import 'package:cake_shop/features/auth/domain/entities/user_entity.dart';
import 'package:cake_shop/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class UserLoginUsecase implements Usecase<UserEntity, UserLoginParams> {
  final AuthRepositoryInterface authRepository;

  UserLoginUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
