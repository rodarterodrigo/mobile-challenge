import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

abstract class GetUserByLoginRepository{
  Future<Either<Failure, bool>> call(String login);
}