import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/update_user_repository.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_user_by_login.dart';
import 'package:mockito/mockito.dart';

class GetUserByLoginRepositoryMock extends Mock implements GetUserByLoginRepository {}

final repository = GetUserByLoginRepositoryMock();
final usecase = GetUserByLogin(repository);

main(){
  test("Must return a UserDetail entity", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Right(true));
    final result = await usecase("login");
    expect(result.fold(id,id), isA<bool>());
  });

  test("Must return a Failure object when user is null", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Left(Failure()));
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an UpdateUserError", () async{
    when(repository(any)).thenThrow(GetUserByLoginError());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an Exception", () async{
    when(repository(any)).thenThrow(Exception());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}