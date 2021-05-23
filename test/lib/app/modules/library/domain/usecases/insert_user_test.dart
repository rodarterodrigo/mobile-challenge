import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/insert_user_repository.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/insert_user.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_id_model.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mockito/mockito.dart';

class InsertUserRepositoryMock extends Mock implements InsertUserRepository {}

final repository = InsertUserRepositoryMock();
final usecase = InsertUser(repository);

final user = UserDetail();

main(){
  test("Must return a integer id when UserDetail is sended", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Right(UserIdModel()));
    final result = await usecase(user);
    expect(result.fold(id,id), isA<UserId>());
  });

  test("Must return a Failure object when user is null", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Left(Failure()));
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an IsertUserError", () async{
    when(repository(any)).thenThrow(IsertUserError());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an Exception", () async{
    when(repository(any)).thenThrow(Exception());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}