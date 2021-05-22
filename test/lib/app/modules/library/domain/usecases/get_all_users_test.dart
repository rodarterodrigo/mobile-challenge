import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/get_all_users_repository.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_all_users.dart';
import 'package:mockito/mockito.dart';

class GetAllUsersRepositoryMock extends Mock implements GetAllUsersRepository {}

final repository = GetAllUsersRepositoryMock();
final usecase = GetAllUsers(repository);

main(){
  test("Must return a UserDetailList", () async{
    when(repository()).thenAnswer((realInvocation) async => Right(UserDetailList()));
    final result = await usecase();
    expect(result.fold(id,id), isA<UserDetailList>());
  });

  test("Must return a Failure object", () async{
    when(repository()).thenAnswer((realInvocation) async => Left(Failure()));
    final result = await usecase();
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an GetAllUsersError", () async{
    when(repository()).thenThrow(GetAllUsersError());
    final result = await usecase();
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an Exception", () async{
    when(repository()).thenThrow(Exception());
    final result = await usecase();
    expect(result.fold(id,id), isA<Failure>());
  });
}