import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/core/shared/widgets/search_card.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_event.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/search_github_user_bloc.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_error_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_initial_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_loading_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_success_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/helpers/search_helper.dart';

class GithubUserSearchDelegate extends SearchDelegate<String>{
  final SearchGithubUserBloc searchGithubUserBloc;
  final SearchHelper searchHelper = SearchHelper();

  GithubUserSearchDelegate(this.searchGithubUserBloc);

  @override
  String get searchFieldLabel => "Buscar usuário";

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context);

  @override
  List<Widget> buildActions(BuildContext context) => [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: (){
        close(context, query == null? "": query);
      },
    );

  @override
  Widget buildResults(BuildContext context) {
    if(query.isNotEmpty){
      searchGithubUserBloc.searchUser = query;
      searchGithubUserBloc.add(SearchGithubUserEvent(query));
      return StreamBuilder(
        stream: searchGithubUserBloc,
        initialData: SearchGithubUserInitialState,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.none) return searchHelper.verifyConnection();

          final state = searchGithubUserBloc.state;
          if(state is SearchGithubUserInitialState) return searchHelper.noResult();
          if(state is SearchGithubUserLoadingState) return Center(child: CircularProgressIndicator());
          if(state is SearchGithubUserFailureState) return searchHelper.dataFail(state.failure.statusMessage);
          if(state is SearchGithubUserErrorState) return searchHelper.dataFail(state.failureSearch.message);
          final list = (state as SearchGithubUserSuccessState).usersList;
          return NotificationListener<ScrollNotification>(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    return SearchCard(
                      onTap: () => Modular.to.pushNamed("/userdetail", arguments: list.users.elementAt(index)),
                      user: list.users.elementAt(index),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: list.users.length),
            )
            // onNotification: (value) => null,
          );
        },
      );
    }else {
      return searchHelper.noResult();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searchHelper.noResult();
  }
}