import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/core/shared/widgets/library_card.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/get_all_users_event.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/library_bloc.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_failure_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/get_all_users_success_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_error_state.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_initial_state.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final libraryBloc = Modular.get<LibraryBloc>();

  @override
  void initState() {
    libraryBloc.add(GetAllUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: libraryBloc,
      initialData: LibraryInitialState,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
        final state = libraryBloc.state;
        if(state is GetAllUsersFailureState) return Center(child: Text(state.failure.statusMessage, style: TextStyle(fontSize: 20)));
        if(state is LibraryErrorState) return Center(child: Text(state.failureLibraryDatabase.message, style: TextStyle(fontSize: 20)));
        final list = (state as GetAllUsersSuccessState).userDetailList;
        return list.users.length >= 1?
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return LibraryCard(
                  onTap: () => Modular.to.pushNamed("/libraryuserdetail", arguments: list.users.elementAt(index)),
                  userDetail: list.users.elementAt(index),
                );
              },
              separatorBuilder: (context, index) => SizedBox(),
              itemCount: list.users.length),
        ):
        Center(
          child: Text("Sua biblioteca de favoritos está vazia",
            style: TextStyle(fontSize: 20),
          ),
        )
        ;
      },
    );
  }
}
