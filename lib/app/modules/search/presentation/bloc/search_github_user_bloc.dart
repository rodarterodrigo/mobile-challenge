import 'package:bloc/bloc.dart';
import 'package:mobile_challenge/app/modules/search/domain/errors/failure_search.dart';
import 'package:mobile_challenge/app/modules/search/domain/usecases/search_github_user.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_event.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_events.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_error_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_initial_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_loading_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_states.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_success_state.dart';

class SearchGithubUserBloc extends Bloc<SearchGithubUserEvents, SearchGithubUserStates>{
  final SearchGithubUser searchGithubUser;
  SearchGithubUserBloc(this.searchGithubUser) : super(SearchGithubUserInitialState());

  @override
  Stream<SearchGithubUserStates> mapEventToState(SearchGithubUserEvents event) async*{
    if(event is SearchGithubUserEvent) yield* _mapSearchGithubUserToState(event);
  }

  Stream<SearchGithubUserStates> _mapSearchGithubUserToState(SearchGithubUserEvent event) async*{
    try {
      yield SearchGithubUserLoadingState();
      final result = await searchGithubUser(event.search);
      yield result.fold((l) => SearchGithubUserFailureState(l), (r) => SearchGithubUserSuccessState(r));
    }
    on FailureSearch catch(e){
      if (e is SearchError) yield SearchGithubUserErrorState(e);
      if (e is SearchGithubUserDatasourceError) yield SearchGithubUserErrorState(e);
    }
  }
}