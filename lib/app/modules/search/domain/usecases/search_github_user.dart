import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';
import 'package:mobile_challenge/app/modules/search/domain/errors/failure_search.dart';
import 'package:mobile_challenge/app/modules/search/domain/repositories/search_github_user_repository.dart';

abstract class SearchGithubUserAbstraction{
  Future<Either<Failure, UsersList>> call(String search);
}

class SearchGithubUser implements SearchGithubUserAbstraction{
  final SearchGithubUserRepository repository;

  SearchGithubUser(this.repository);

  @override
  Future<Either<Failure, UsersList>> call(String search) async {
    try{
      return search == null? Left(Failure(status: "Busca nula", statusMessage: "A query não pode ser nula")):
      search.isEmpty? Left(Failure(status: "Busca vazia", statusMessage: "Digite algo para buscar")):
      await repository(search);
    }
    on SearchError catch(e){
      return Left(Failure(status: "SearchError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}