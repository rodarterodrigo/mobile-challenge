import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';

abstract class SearchGithubUserRepository{
  Future<Either<Failure, UsersList>> call(String query, int itensPerPage, int page);
}