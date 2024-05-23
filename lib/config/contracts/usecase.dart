import 'package:cake_shop/config/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SuccessType, Params>{
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams{}