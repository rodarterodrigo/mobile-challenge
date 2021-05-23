import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_id_model.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

abstract class UpdateUserDatasource{
  Future<Either<FailureModel, UserIdModel>> call(UserDetail userDetail);
}