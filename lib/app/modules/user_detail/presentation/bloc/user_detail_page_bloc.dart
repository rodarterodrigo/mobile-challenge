import 'package:bloc/bloc.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/errors/user_detail_failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/usecases/show_user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/search_user_event.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/show_user_detail_events.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_error_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_failure_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_initial_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_loading_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_states.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_success_state.dart';

class UserDetailPageBloc extends Bloc<ShowUserDetailEvents, ShowUserDetailStates>{
  final ShowUserDetail showUserDetail;
  UserDetailPageBloc(this.showUserDetail) : super(ShowUserDetailInitialState());

  @override
  Stream<ShowUserDetailStates> mapEventToState(ShowUserDetailEvents event) async*{
    if(event is ShowUserDetailEvent) yield* _mapShowUserDetailToState(event);
  }

  Stream<ShowUserDetailStates> _mapShowUserDetailToState(ShowUserDetailEvent event) async*{
    try {
      yield ShowUserDetailLoadingState();
      final result = await showUserDetail(event.userLogin);
      yield result.fold((l) => ShowUserDetailFailureState(l), (r) => ShowUserDetailSuccessState(r));
    }
    on UserDetailFailure catch(e){
      if (e is UserDetailError) yield ShowUserDetailErrorState(e);
      if (e is ShowUserDetailDatasourceError) yield ShowUserDetailErrorState(e);
    }
  }
}