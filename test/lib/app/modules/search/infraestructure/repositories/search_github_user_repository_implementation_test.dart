import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/datasources/search_github_user_datasource.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/models/users_list_model.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/repositories/search_github_user_repository_implementation.dart';
import 'package:mockito/mockito.dart';

class SearchGithubUserDatasourceMock extends Mock implements SearchGithubUserDatasource{}

final datasource = SearchGithubUserDatasourceMock();
final repository = SearchGithubUserRepositoryImplementation(datasource);

main(){
  test("Must return an UserList object", () async {
    when(datasource(any)).thenAnswer((realInvocation) async => Right(UsersListModel()));
    final result = await repository("test");
    expect(result.fold(id,id), isA<UsersList>());
  });

  test("Must return an Failure object", () async {
    when(datasource(any)).thenAnswer((realInvocation) async => Left(FailureModel()));
    final result = await repository("");
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an SearchGithubUserDatasourceError", () async {
    when(datasource(any)).thenThrow(SearchGithubUserDatasourceError());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an Exception", () async {
    when(datasource(any)).thenThrow(Exception());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}