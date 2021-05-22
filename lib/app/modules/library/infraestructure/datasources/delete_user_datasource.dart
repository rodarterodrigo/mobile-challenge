import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';

abstract class DeleteUserDatasource{
  Future<Either<FailureModel, int>> call(int userId);
}