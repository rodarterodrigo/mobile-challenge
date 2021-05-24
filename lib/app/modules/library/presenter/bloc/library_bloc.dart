import 'package:bloc/bloc.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/delete_user.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_all_users.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_user_by_login.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/insert_user.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/get_all_users_event.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/library_events.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_error_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_initial_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_states.dart';

class LibraryBloc extends Bloc<LibraryEvents, LibraryStates>{
  final GetAllUsers getAllUsers;

  LibraryBloc(this.getAllUsers) : super(LibraryInitialState());

  @override
  Stream<LibraryStates> mapEventToState(LibraryEvents event) async*{
    if(event is GetAllUsersEvent) yield* _mapGetAllUsersToState(event);
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
}