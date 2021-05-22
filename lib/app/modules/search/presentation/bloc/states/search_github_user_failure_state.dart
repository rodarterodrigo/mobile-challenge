import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_states.dart';

class SearchGithubUserFailureState extends SearchGithubUserStates{
  final Failure failure;

  SearchGithubUserFailureState(this.failure);
}