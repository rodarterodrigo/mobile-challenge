import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/packages/dio_client.dart';
import 'package:mobile_challenge/app/modules/search/external/datasources/search_github_user_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/models/users_list_model.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/search_datasource_response.dart';

class DioMock extends Mock implements DioClient{}

final dio = DioMock();
final datasource = SearchGithubUserDatasourceImplementation(dio);

main(){
  test("Must complete the request", (){
    when(dio.get(any)).thenAnswer((realInvocation)
    async => Response(data: searchGithubUserDatasourceResponse, statusCode: 200));
    final result = datasource("search");
    expect(result, completes);
  });

  test("Must return an UserListModel object", () async{
    when(dio.get(any)).thenAnswer((realInvocation)
    async => Response(data: searchGithubUserDatasourceResponse, statusCode: 200));
    final result = await datasource("search");
    expect(result.fold(id,id), isA<UsersListModel>());
  });
  test("Must returna an FailureModel when throws a SearchGithubUserDatasourceError", () async{
    when(dio.get(any)).thenThrow(SearchGithubUserDatasourceError());
    final result = await datasource("search");
    expect(result.fold(id,id), isA<FailureModel>());
  });

  test("Must returna an FailureModel when throws a Exception", () async{
    when(dio.get(any)).thenThrow(Exception());
    final result = await datasource("search");
    expect(result.fold(id,id), isA<FailureModel>());
  });
}