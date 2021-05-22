import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';

abstract class DeleteUserRepository{
  Future<Either<Failure, int>> call(int userId);
}