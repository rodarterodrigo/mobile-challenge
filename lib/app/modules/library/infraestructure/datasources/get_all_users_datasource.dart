import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_detail_list_model.dart';

abstract class GetAllUsersDatasource{
  Future<Either<FailureModel, UserDetailListModel>> call();
}