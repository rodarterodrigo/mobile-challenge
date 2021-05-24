import 'package:bloc/bloc.dart';
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
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/library_events.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/delete_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/delete_user_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_user_by_login_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_user_by_login_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/insert_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/insert_user_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_error_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_initial_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_states.dart';

class LibraryBloc extends Bloc<LibraryEvents, LibraryStates>{
  final InsertUser insertUser;
  final DeleteUser deleteUser;
  final GetAllUsers getAllUsers;
  final GetUserByLogin getUserByLogin;

  LibraryBloc(
      this.insertUser,
      this.deleteUser,
      this.getAllUsers,
      this.getUserByLogin
      ) : super(LibraryInitialState());

  @override
  Stream<LibraryStates> mapEventToState(LibraryEvents event) async*{
    if(event is InsertUserEvent) yield* _mapInserUserToState(event);
    if(event is DeleteUserEvent) yield* _mapDeleteUserToState(event);
    if(event is GetAllUsersEvent) yield* _mapGetAllUsersToState(event);
    if(event is GetUserByLoginEvent) yield* _mapGetUserByLoginToState(event);
  }

  Stream<LibraryStates> _mapInserUserToState(InsertUserEvent event) async*{
    try {
      final result = await insertUser(event.userDetail);
      yield result.fold((l) => InsertUserFailureState(l), (r) => InsertUserSuccessState(r));
    }
    on FailureLibraryDatabase catch(e){
      if (e is InsertUserError) yield LibraryErrorState(e);
      if (e is InsertUserDatasourceError) yield LibraryErrorState(e);
    }
  }

  Stream<LibraryStates> _mapDeleteUserToState(DeleteUserEvent event) async*{
    try {
      final result = await deleteUser(event.userId);
      yield result.fold((l) => DeleteUserFailureState(l), (r) => DeleteUserSuccessState(r));
    }
    on FailureLibraryDatabase catch(e){
      if (e is DeleteUserError) yield LibraryErrorState(e);
      if (e is DeleteUserDatasourceError) yield LibraryErrorState(e);
    }
  }

  Stream<LibraryStates> _mapGetAllUsersToState(GetAllUsersEvent event) async*{
    try {
      final result = await getAllUsers();
      yield result.fold((l) => GetAllUsersFailureState(l), (r) => GetAllUsersSuccessState(r));
    }
    on FailureLibraryDatabase catch(e){
      if (e is GetAllUsersError) yield LibraryErrorState(e);
      if (e is GetAllUsersDatasourceError) yield LibraryErrorState(e);
    }
  }

  Stream<LibraryStates> _mapGetUserByLoginToState(GetUserByLoginEvent event) async*{
    try {
      final result = await getUserByLogin(event.login);
      yield result.fold((l) => GetUserByLoginFailureState(l), (r) => GetUserByLoginSuccessState(r));
    }
    on FailureLibraryDatabase catch(e){
      if (e is GetAllUsersError) yield LibraryErrorState(e);
      if (e is GetAllUsersDatasourceError) yield LibraryErrorState(e);
    }
  }
}