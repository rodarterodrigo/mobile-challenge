import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/get_user_by_login_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/get_user_by_login_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mockito/mockito.dart';

class GetUserByLoginDatasourceMock extends Mock implements GetUserByLoginDatasource{}

final datasource = GetUserByLoginDatasourceMock();
final repository = GetUserByLoginRepositoryImplementation(datasource);

final user = UserDetail();

main(){
  test("Must return an integer id when for a sended UserDetail entity", () async {
    when(datasource(any)).thenAnswer((realInvocation) async => Right(true));
    final result = await repository("login");
    expect(result.fold(id,id), isA<bool>());
  });

  test("Must return an Failure object", () async {
    when(datasource(any)).thenAnswer((realInvocation) async => Left(FailureModel()));
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an GetUserByLoginDatasourceError", () async {
    when(datasource(any)).thenThrow(GetUserByLoginDatasourceError());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an Exception", () async {
    when(datasource(any)).thenThrow(Exception());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}