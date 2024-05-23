import 'package:cake_shop/core/contracts/usecase.dart';
import 'package:cake_shop/core/dtos/user_register_dto.dart';
import 'package:cake_shop/core/errors/failures.dart';
import 'package:cake_shop/features/auth/domain/entities/user_entity.dart';
import 'package:cake_shop/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class UserRegisterUsecase implements Usecase<UserEntity, UserRegisterDTO> {
  final AuthRepositoryInterface authRepository;

  UserRegisterUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserRegisterDTO params) async {
    return await authRepository.registerWithEmailPassword(
      firstName: params.firstName,
      lastName: params.lastName,
      mobile: params.mobile,
      email: params.email,
      password: params.password,
    );
  }
}


