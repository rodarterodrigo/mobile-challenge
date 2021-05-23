import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_events.dart';

class SearchGithubUserEvent extends SearchGithubUserEvents{
  final String search;
  final int itemsPerPage;
  final int page;

  SearchGithubUserEvent(this.search, this.itemsPerPage, this.page);
}