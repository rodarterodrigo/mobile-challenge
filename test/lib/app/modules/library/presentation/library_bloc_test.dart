import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_all_users.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/get_all_users_event.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/library_bloc.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_error_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mockito/mockito.dart';

class GetAllUsersMock extends Mock implements GetAllUsers{}

final getAllUsers = GetAllUsersMock();

final bloc = LibraryBloc(getAllUsers);
final userDetail = UserDetail();

main(){
  //getAllUsers
  test("Must return all states in order.", (){
    when(getAllUsers()).thenAnswer((realInvocation) async => Right(UserDetailList()));
    expect(bloc, emitsInOrder([
      isA<GetAllUsersSuccessState>(),
    ]));
    bloc.add(GetAllUsersEvent());
  });

  test("Must return all states in order and show error state", (){
    when(getAllUsers()).thenAnswer((realInvocation) async => Left(Failure()));
    expect(bloc, emitsInOrder([
      isA<GetAllUsersFailureState>(),
    ]));
    bloc.add(GetAllUsersEvent());
  });

  test("Must return all states in order and show error exception state", (){
    when(getAllUsers()).thenThrow(GetAllUsersError());
    expect(bloc, emitsInOrder([
      isA<LibraryErrorState>(),
    ]));
    bloc.add(GetAllUsersEvent());
  });

  test("Must return all states in order and show error exception state", (){
    when(getAllUsers()).thenThrow(GetAllUsersDatasourceError());
    expect(bloc, emitsInOrder([
      isA<LibraryErrorState>(),
    ]));
    bloc.add(GetAllUsersEvent());
  });
}