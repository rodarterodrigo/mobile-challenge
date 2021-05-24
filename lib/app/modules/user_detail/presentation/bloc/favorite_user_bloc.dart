import 'package:bloc/bloc.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/insert_user.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/favorite_user_events/favorite_user_event.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/favorite_user_events/favorite_user_events.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_error_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_initial_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_states.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_success_state.dart';

class FavoriteUserBloc extends Bloc<FavoriteUserEvents, FavoriteUserStates>{
  final InsertUser insertUser;
  FavoriteUserBloc(this.insertUser) : super(FavoriteUserInitialState());

  @override
  Stream<FavoriteUserStates> mapEventToState(FavoriteUserEvents event) async*{
    if(event is FavoriteUserEvent) yield* _mapFavoriteUserToState(event);
  }

  Stream<FavoriteUserStates> _mapFavoriteUserToState(FavoriteUserEvent event) async*{
    try {
      final result = await insertUser(event.userDetail);
      yield result.fold((l) => FavoriteUserFailureState(l), (r) => FavoriteUserSuccessState(r));
    }
    on FailureLibraryDatabase catch(e){
      if (e is InsertUserError) yield FavoriteUserErrorState(e);
      if (e is InsertUserDatasourceError) yield FavoriteUserErrorState(e);
    }
  }
}