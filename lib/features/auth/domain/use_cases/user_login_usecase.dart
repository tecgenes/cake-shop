import 'package:cake_shop/core/contracts/usecase.dart';
import 'package:cake_shop/core/dtos/user_login_dto.dart';
import 'package:cake_shop/core/errors/failures.dart';
import 'package:cake_shop/features/auth/domain/entities/user_entity.dart';
import 'package:cake_shop/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class UserLoginUsecase implements Usecase<UserEntity, UserLoginDTO> {
  final AuthRepositoryInterface authRepository;

  UserLoginUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserLoginDTO loginDTO) async {
    return await authRepository.loginWithEmailPassword(
      email: loginDTO.email,
      password: loginDTO.password,
    );
  }
}
