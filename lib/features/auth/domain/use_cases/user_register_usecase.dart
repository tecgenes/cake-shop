import 'package:cake_shop/config/contracts/usecase.dart';
import 'package:cake_shop/config/errors/failures.dart';
import 'package:cake_shop/features/auth/domain/entities/user_entity.dart';
import 'package:cake_shop/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class UserRegisterUsecase implements Usecase<UserEntity, UserRegisterParams> {
  final AuthRepositoryInterface authRepository;

  UserRegisterUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserRegisterParams params) async {
    return await authRepository.registerWithEmailPassword(
      firstName: params.firstName,
      lastName: params.lastName,
      mobile: params.mobile,
      email: params.email,
      password: params.password,
    );
  }
}

class UserRegisterParams {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final String password;

  UserRegisterParams({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.password,
  });
}
