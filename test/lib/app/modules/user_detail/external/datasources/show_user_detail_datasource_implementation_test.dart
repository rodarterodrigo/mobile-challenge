import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/packages/dio_client.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/user_detail/external/datasources/show_user_detail_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/models/user_detail_model.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/user_detail_datasource_response.dart';

class DioMock extends Mock implements DioClient{}

final dio = DioMock();
final datasource = ShowUserDetailDatasourceImplementation(dio);

main(){
  test("Must complete the request", (){
    when(dio.get(any)).thenAnswer((realInvocation)
    async => Response(data: userDetailDatasourceResponse, statusCode: 200));
    final result = datasource("search");
    expect(result, completes);
  });

  test("Must return an UserDetailModel object", () async{
    when(dio.get(any)).thenAnswer((realInvocation)
    async => Response(data: userDetailDatasourceResponse, statusCode: 200));
    final result = await datasource("search");
    expect(result.fold(id,id), isA<UserDetailModel>());
  });
  test("Must returna an FailureModel when throws a ShowUserDetailDatasourceError", () async{
    when(dio.get(any)).thenThrow(ShowUserDetailDatasourceError());
    final result = await datasource("search");
    expect(result.fold(id,id), isA<FailureModel>());
  });

  test("Must returna an FailureModel when throws a Exception", () async{
    when(dio.get(any)).thenThrow(Exception());
    final result = await datasource("search");
    expect(result.fold(id,id), isA<FailureModel>());
  });
}