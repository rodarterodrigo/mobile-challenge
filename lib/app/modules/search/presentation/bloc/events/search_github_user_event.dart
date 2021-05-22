import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_events.dart';

class SearchGithubUserEvent extends SearchGithubUserEvents{
  final String search;

  SearchGithubUserEvent(this.search);
}