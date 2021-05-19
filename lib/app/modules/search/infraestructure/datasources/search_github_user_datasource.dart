import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/models/users_list_model.dart';

abstract class SearchGithubUserDatasource{
  Future<Either<FailureModel, UsersListModel>> call(String search);
}