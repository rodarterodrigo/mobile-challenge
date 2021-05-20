import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/packages/dio_client.dart';
import 'package:mobile_challenge/app/modules/search/external/settings/settings.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/datasources/search_github_user_datasource.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/models/users_list_model.dart';

class SearchGithubUserDatasourceImplementation implements SearchGithubUserDatasource{
  final DioClientImplementation dio;

  SearchGithubUserDatasourceImplementation(this.dio);

  @override
  Future<Either<FailureModel, UsersListModel>> call(String search) async{
    try {
      final response = await dio.get(Settings.searchUserUrl + 'q=${search}');

      if (response.statusCode != 200)
        throw SearchGithubUserDatasourceError(
            message: "Status code : ${response.statusCode}");
      else
        return Right(UsersListModel.fromJson(response.data));
    }
    on SearchGithubUserDatasourceError catch(e){
      return Left(FailureModel(status: "SearchGithubUserDatasourceError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(FailureModel(status: "Exception", statusMessage: e.toString()));
    }
  }
}