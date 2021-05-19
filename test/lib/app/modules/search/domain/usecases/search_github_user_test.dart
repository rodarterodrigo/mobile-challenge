import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';
import 'package:mobile_challenge/app/modules/search/domain/errors/failure_search.dart';
import 'package:mobile_challenge/app/modules/search/domain/repositories/search_github_user_repository.dart';
import 'package:mobile_challenge/app/modules/search/domain/usecases/search_github_user.dart';
import 'package:mockito/mockito.dart';

class SearchGithubUserRepositoryMock extends Mock implements SearchGithubUserRepository {}

final repository = SearchGithubUserRepositoryMock();
final usecase = SearchGithubUser(repository);

main(){
  test("Must return a UsersList object when query is filled", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Right(UsersList()));
    final result = await usecase("teste");
    expect(result.fold(id,id), isA<UsersList>());
  });

  test("Must return a Failure object when query isn't filled", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Left(Failure()));
    final result = await usecase("");
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when query is null", () async{
    when(repository(any)).thenThrow(SearchError());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an Exception", () async{
    when(repository(any)).thenThrow(Exception());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}