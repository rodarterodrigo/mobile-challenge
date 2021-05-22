import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/get_all_users_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_detail_list_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/get_all_users_repository_implementation.dart';
import 'package:mockito/mockito.dart';

class GetAllUsersDatasourceMock extends Mock implements GetAllUsersDatasource{}

final datasource = GetAllUsersDatasourceMock();
final repository = GetAllUsersRepositoryImplementation(datasource);

main(){
  test("Must return an UserDetailList entity", () async {
    when(datasource()).thenAnswer((realInvocation) async => Right(UserDetailListModel()));
    final result = await repository();
    expect(result.fold(id,id), isA<UserDetailList>());
  });

  test("Must return an Failure object", () async {
    when(datasource()).thenAnswer((realInvocation) async => Left(FailureModel()));
    final result = await repository();
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an GetAllUsersDatasourceError", () async {
    when(datasource()).thenThrow(GetAllUsersDatasourceError());
    final result = await repository();
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an Exception", () async {
    when(datasource()).thenThrow(Exception());
    final result = await repository();
    expect(result.fold(id,id), isA<Failure>());
  });
}