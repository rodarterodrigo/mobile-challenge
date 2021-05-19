import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';
import 'package:mobile_challenge/app/modules/search/domain/repositories/search_github_user_repository.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/datasources/search_github_user_datasource.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/errors/errors.dart';

class SearchGithubUserRepositoryImplementation implements SearchGithubUserRepository{
  final SearchGithubUserDatasource datasource;

  SearchGithubUserRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, UsersList>> call(String search) async{
    try{
      return await datasource(search)..fold((l) => Left(l), (r) => Right(r));
    }
    on SearchGithubUserDatasourceError catch(e){
      return Left(Failure(status: "SearchGithubUserDatasourceError", statusMessage: e.toString()));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}