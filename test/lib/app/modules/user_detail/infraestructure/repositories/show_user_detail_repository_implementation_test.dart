import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/datasources/show_user_detail_datasource.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/models/user_detail_model.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/repositories/show_user_detail_repository_implementation.dart';
import 'package:mockito/mockito.dart';

class ShowUserDetailDatasourceMock extends Mock implements ShowUserDetailDatasource{}

final datasource = ShowUserDetailDatasourceMock();
final repository = ShowUserDetailRepositoryImplementation(datasource);

main(){
  test("Must return an UserDetail object", () async {
    when(datasource(any)).thenAnswer((realInvocation) async => Right(UserDetailModel()));
    final result = await repository("test");
    expect(result.fold(id,id), isA<UserDetail>());
  });

  test("Must return an Failure object", () async {
    when(datasource(any)).thenAnswer((realInvocation) async => Left(FailureModel()));
    final result = await repository("");
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an ShowUserDetailDatasourceError", () async {
    when(datasource(any)).thenThrow(ShowUserDetailDatasourceError());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return an Failure object when trhows an Exception", () async {
    when(datasource(any)).thenThrow(Exception());
    final result = await repository(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}