import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/events/change_page_index_event.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/states/change_page_index_state.dart';
import 'package:mobile_challenge/app/modules/home/presentation/navigation/navigation.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/search_github_user_bloc.dart';
import 'package:mobile_challenge/app/modules/search/presentation/views/github_user_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeBloc = Modular.get<HomeBloc>();
  final searchBloc = Modular.get<SearchGithubUserBloc>();

  final Navigation navigation = Navigation();

  @override
  void dispose() {
    homeBloc.close();
    searchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: ChangePageIndexState,
      stream: homeBloc,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
              opacity: 1,
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => showSearch(context: context, delegate: GithubUserSearchDelegate(searchBloc)))
            ],
            centerTitle: true,
            title: Text(
                "Mobile Challenge"
            ),
            elevation: 6,
          ),
          body: Container(
            child: Center(
              child: Text(
                  "HomePage"
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme
                .of(context)
                .primaryColor,
            type: BottomNavigationBarType.fixed,
            items: navigation.bottonNavigation(),
            currentIndex: homeBloc.index,
            onTap: (index) => homeBloc.add(ChangePageIndexEvent(index)),
          ),
        );
      },
    );
  }
}
