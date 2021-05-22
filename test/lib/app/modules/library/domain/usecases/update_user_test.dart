import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/update_user_repository.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/update_user.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mockito/mockito.dart';

class UpdateUserRepositoryMock extends Mock implements UpdateUserRepository {}

final repository = UpdateUserRepositoryMock();
final usecase = UpdateUser(repository);

final user = UserDetail();

main(){
  test("Must return a integer id when UserDetail is sended", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Right(2));
    final result = await usecase(user);
    expect(result.fold(id,id), isA<int>());
  });

  test("Must return a Failure object when user is null", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Left(Failure()));
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an UpdateUserError", () async{
    when(repository(any)).thenThrow(UpdateUserError());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an Exception", () async{
    when(repository(any)).thenThrow(Exception());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}