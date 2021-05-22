import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/delete_user_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/delete_user_repository_implementation.dart';
import 'package:mockito/mockito.dart';

class DeleteUserDatasourceMock extends Mock implements DeleteUserDatasource{}

final datasource = DeleteUserDatasourceMock();
final repository = DeleteUserRepositoryImplementation(datasource);

main(){
  test("Must return an integer id when for a sended userId to remove", () async {
    when(datasource(any)).thenAnswer((realInvocation) async => Right(2));
    final result = await repository(2);
    expect(result.fold(id,id), isA<int>());
  });

  test("Must return an Failure object", () async {
    when(datasource(any)).thenAnswer((realInvocation) async => Left(FailureModel()));
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an DeleteUserDatasourceError", () async {
    when(datasource(any)).thenThrow(DeleteUserDatasourceError());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an Exception", () async {
    when(datasource(any)).thenThrow(Exception());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}