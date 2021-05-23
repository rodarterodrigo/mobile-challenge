import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_id_model.dart';

abstract class DeleteUserDatasource{
  Future<Either<FailureModel, UserIdModel>> call(int userId);
}