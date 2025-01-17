import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/get_user_by_login_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/insert_user_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_id_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/insert_user_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mockito/mockito.dart';

class InsertUserDatasourceMock extends Mock implements InsertUserDatasource{}

final insertDatasource = InsertUserDatasourceMock();
final repository = InsertUserRepositoryImplementation(insertDatasource);

final user = UserDetail();

main(){
  test("Must return an integer id when for a sended UserDetail entity", () async {
    when(insertDatasource(any)).thenAnswer((realInvocation) async => Right(UserIdModel()));
    final result = await repository(user);
    expect(result.fold(id,id), isA<UserId>());
  });

  test("Must return an Failure object", () async {
    when(insertDatasource(any)).thenAnswer((realInvocation) async => Left(FailureModel()));
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an InsertUserDatasourceError", () async {
    when(insertDatasource(any)).thenThrow(InsertUserDatasourceError());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an Exception", () async {
    when(insertDatasource(any)).thenThrow(Exception());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}