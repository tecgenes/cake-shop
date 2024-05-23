import 'package:cake_shop/config/contracts/usecase.dart';
import 'package:cake_shop/config/errors/failures.dart';
import 'package:cake_shop/features/auth/domain/entities/user_entity.dart';
import 'package:cake_shop/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUserUsecase implements Usecase<UserEntity, NoParams>{
  final AuthRepositoryInterface authRepository;
  CurrentUserUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(params) async{
    return await authRepository.currentUser();
  }

}