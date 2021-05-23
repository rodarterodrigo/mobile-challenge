import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/delete_user_repository.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/delete_user.dart';
import 'package:mockito/mockito.dart';

class DeleteUserRepositoryMock extends Mock implements DeleteUserRepository {}

final repository = DeleteUserRepositoryMock();
final usecase = DeleteUser(repository);

main(){
  test("Must return a integer id when userId is sended to remove", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Right(UserId()));
    final result = await usecase(2);
    expect(result.fold(id,id), isA<UserId>());
  });

  test("Must return a Failure object when id is null", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Left(Failure()));
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an DeleteUserError", () async{
    when(repository(any)).thenThrow(DeleteUserError());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an Exception", () async{
    when(repository(any)).thenThrow(Exception());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}