import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/errors/user_detail_failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/repositories/show_user_detail_repository.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/usecases/show_user_detail.dart';
import 'package:mockito/mockito.dart';

class ShowUserDetailRepositoryMock extends Mock implements ShowUserDetailRepository {}

final repository = ShowUserDetailRepositoryMock();
final usecase = ShowUserDetail(repository);

main(){
  test("Must return a UsersList object when parameter is filled", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Right(UserDetail()));
    final result = await usecase("parameter");
    expect(result.fold(id,id), isA<UserDetail>());
  });

  test("Must return a Failure object when parameter isn't filled", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Left(Failure()));
    final result = await usecase("");
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when query is null", () async{
    when(repository(any)).thenAnswer((realInvocation) async => Left(Failure()));
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an UserDetailError", () async{
    when(repository(any)).thenThrow(UserDetailError());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });

  test("Must return a Failure object when throws an Exception", () async{
    when(repository(any)).thenThrow(Exception());
    final result = await usecase(null);
    expect(result.fold(id,id), isA<Failure>());
  });
}