import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_event.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/search_github_user_bloc.dart';

abstract class SearchBlocMethodsHelperAbstraction{
  bool handleNotification(ScrollNotification scrollInfo, String search);
  void initialize();
}

class SearchBlocMethodsHelper implements SearchBlocMethodsHelperAbstraction{
  final SearchGithubUserBloc searchGithubUserBloc;

  SearchBlocMethodsHelper(this.searchGithubUserBloc);

  @override
  bool handleNotification(ScrollNotification scrollInfo, String search) {
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      if (!searchGithubUserBloc.lastPage) {
        searchGithubUserBloc.itemPage++;
        searchGithubUserBloc.lastPage = true;
        searchGithubUserBloc.add(SearchGithubUserEvent(search, 10, searchGithubUserBloc.itemPage));
        return true;
      }
      return true;
    }
    return false;
  }

  @override
  void initialize() {
    searchGithubUserBloc.finalPage = 1;
    searchGithubUserBloc.itemPage = 1;
    searchGithubUserBloc.itemIndex = 0;
    searchGithubUserBloc.usersList.users?.clear();
    searchGithubUserBloc.lastPage = false;
  }
}