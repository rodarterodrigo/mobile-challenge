import 'package:mobile_challenge/app/modules/search/domain/errors/failure_search.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_states.dart';

class SearchGithubUserErrorState extends SearchGithubUserStates{
  final FailureSearch failureSearch;

  SearchGithubUserErrorState(this.failureSearch);
}