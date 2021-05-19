import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';

abstract class SearchGithubUserRepository{
  Future<Either<Failure, UsersList>> call(String query);
}