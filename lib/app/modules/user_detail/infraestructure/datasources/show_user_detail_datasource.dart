import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/models/user_detail_model.dart';

abstract class ShowUserDetailDatasource{
  Future<Either<FailureModel, UserDetailModel>> call(String userLogin);
}