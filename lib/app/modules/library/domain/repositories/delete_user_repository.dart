import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';

abstract class DeleteUserRepository{
  Future<Either<Failure, UserId>> call(int userId);
}