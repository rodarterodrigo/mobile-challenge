import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_event.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/search_github_user_bloc.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_error_state.dart';
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
          if(state is SearchGithubUserLoadingState) return Center(child: CircularProgressIndicator());
          if(state is SearchGithubUserErrorState) return searchHelper.dataFail(state.failureSearch.message);
          final list = (state as SearchGithubUserSuccessState).usersList;
          return NotificationListener<ScrollNotification>(
            child: list.users.length <1 || list == null ? Center(child: CircularProgressIndicator()):
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Hero(
                            tag: list.users.elementAt(index).login,
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Card(
                                    child: CachedNetworkImage(
                                      height: 100,
                                      imageUrl: list.users.elementAt(index).avatarUrl, fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width/4),
                                  Text(list.users.elementAt(index).login?? "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        onTap: () => null //Modular.to.pushNamed(Routes.userDetailPage,arguments: list.users.elementAt(index)),
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