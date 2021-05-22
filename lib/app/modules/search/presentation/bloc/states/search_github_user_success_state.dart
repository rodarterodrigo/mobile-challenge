import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_states.dart';

class SearchGithubUserSuccessState extends SearchGithubUserStates{
  final UsersList usersList;

  SearchGithubUserSuccessState(this.usersList);
}