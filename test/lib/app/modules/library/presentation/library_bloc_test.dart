import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/delete_user.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_all_users.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_user_by_login.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/insert_user.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/delete_user_event.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/get_all_users_event.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/get_user_by_login_event.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/insert_user_event.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/library_bloc.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/delete_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/delete_user_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_user_by_login_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_user_by_login_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/insert_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/insert_user_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_error_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_loading_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mockito/mockito.dart';

class InsertUserMock extends Mock implements InsertUser{}
class DeleteUserMock extends Mock implements DeleteUser{}
class GetAllUsersMock extends Mock implements GetAllUsers{}
class GetUserByLoginMock extends Mock implements GetUserByLogin{}

final insertUser = InsertUserMock();
final deleteUser = DeleteUserMock();
final getAllUsers = GetAllUsersMock();
final getUserByLogin = GetUserByLoginMock();

final bloc = LibraryBloc(insertUser, deleteUser, getAllUsers, getUserByLogin);
final userDetail = UserDetail();

main(){
  //insertUser
  test("Must return all states in order.", (){
    when(insertUser(userDetail)).thenAnswer((realInvocation) async => Right(UserId()));
    expect(bloc, emitsInOrder([
      isA<InsertUserSuccessState>(),
    ]));
    bloc.add(InsertUserEvent(userDetail));
  });

  test("Must return all states in order and show error state", (){
    when(insertUser(userDetail)).thenAnswer((realInvocation) async => Left(Failure()));
    expect(bloc, emitsInOrder([
      isA<InsertUserFailureState>(),
    ]));
    bloc.add(InsertUserEvent(userDetail));
  });

  test("Must return all states in order and show error exception state", (){
    when(insertUser(userDetail)).thenThrow(InsertUserError());
    expect(bloc, emitsInOrder([
      isA<LibraryErrorState>(),
    ]));
    bloc.add(InsertUserEvent(userDetail));
  });

  test("Must return all states in order and show error exception state", (){
    when(insertUser(userDetail)).thenThrow(InsertUserDatasourceError());
    expect(bloc, emitsInOrder([
      isA<LibraryErrorState>(),
    ]));
    bloc.add(InsertUserEvent(userDetail));
  });

  //deleteUser
  test("Must return all states in order.", (){
    when(deleteUser(1)).thenAnswer((realInvocation) async => Right(UserId()));
    expect(bloc, emitsInOrder([
      isA<DeleteUserSuccessState>(),
    ]));
    bloc.add(DeleteUserEvent(1));
  });

  test("Must return all states in order and show error state", (){
    when(deleteUser(1)).thenAnswer((realInvocation) async => Left(Failure()));
    expect(bloc, emitsInOrder([
      isA<DeleteUserFailureState>(),
    ]));
    bloc.add(DeleteUserEvent(1));
  });

  test("Must return all states in order and show error exception state", (){
    when(deleteUser(1)).thenThrow(DeleteUserError());
    expect(bloc, emitsInOrder([
      isA<LibraryErrorState>(),
    ]));
    bloc.add(DeleteUserEvent(1));
  });

  test("Must return all states in order and show error exception state", (){
    when(deleteUser(1)).thenThrow(DeleteUserDatasourceError());
    expect(bloc, emitsInOrder([
      isA<LibraryErrorState>(),
    ]));
    bloc.add(DeleteUserEvent(1));
  });
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
  //getUserByLogin
  test("Must return all states in order.", (){
    when(getUserByLogin("login")).thenAnswer((realInvocation) async => Right(true));
    expect(bloc, emitsInOrder([
      isA<GetUserByLoginSuccessState>(),
    ]));
    bloc.add(GetUserByLoginEvent("login"));
  });

  test("Must return all states in order and show error state", (){
    when(getUserByLogin("login")).thenAnswer((realInvocation) async => Left(Failure()));
    expect(bloc, emitsInOrder([
      isA<GetUserByLoginFailureState>(),
    ]));
    bloc.add(GetUserByLoginEvent("login"));
  });

  test("Must return all states in order and show error exception state", (){
    when(getUserByLogin("login")).thenThrow(GetAllUsersError());
    expect(bloc, emitsInOrder([
      isA<LibraryErrorState>(),
    ]));
    bloc.add(GetUserByLoginEvent("login"));
  });

  test("Must return all states in order and show error exception state", (){
    when(getUserByLogin("login")).thenThrow(GetAllUsersDatasourceError());
    expect(bloc, emitsInOrder([
      isA<LibraryErrorState>(),
    ]));
    bloc.add(GetUserByLoginEvent("login"));
  });
}