import 'package:bloc/bloc.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';
import 'package:mobile_challenge/app/modules/search/domain/errors/failure_search.dart';
import 'package:mobile_challenge/app/modules/search/domain/usecases/search_github_user.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_event.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_events.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_error_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_initial_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_states.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_success_state.dart';

class SearchGithubUserBloc extends Bloc<SearchGithubUserEvents, SearchGithubUserStates>{
  final SearchGithubUser searchGithubUser;
  SearchGithubUserBloc(this.searchGithubUser) : super(SearchGithubUserInitialState());

  String searchUser = "";
  UsersList usersList = UsersList();
  int itemIndex = 0;
  bool lastPage = false;
  int itemPage = 1;
  int finalPage = 1;

  @override
  Stream<SearchGithubUserStates> mapEventToState(SearchGithubUserEvents event) async*{
    if(event is SearchGithubUserEvent) yield* _mapSearchGithubUserToState(event);
  }

  Stream<SearchGithubUserStates> _mapSearchGithubUserToState(SearchGithubUserEvent event) async*{
    try {
      final result = await searchGithubUser(event.search, 10, event.page);
      yield result.fold((l) => SearchGithubUserFailureState(l), (r) {
        if (r?.users != null && r.users.length < 10)
          lastPage = true;
        else
          lastPage = false;
        if (itemPage == 1)
          this.usersList.users = r.users;
        else if (itemPage != finalPage) {
          this.usersList.users += r.users;
          finalPage = itemPage;
        }
        return SearchGithubUserSuccessState(usersList);
      });
    }
    on FailureSearch catch(e){
      if (e is SearchError) yield SearchGithubUserErrorState(e);
      if (e is SearchGithubUserDatasourceError) yield SearchGithubUserErrorState(e);
    }
  }
}