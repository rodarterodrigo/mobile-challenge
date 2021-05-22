import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';

abstract class GetAllUsersDatasource{
  Future<Either<FailureModel, UserDetailList>> call();
}