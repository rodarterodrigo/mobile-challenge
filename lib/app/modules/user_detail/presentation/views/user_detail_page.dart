import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/user.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/search_user_event.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_error_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_failure_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_initial_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_loading_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_success_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/user_detail_bloc.dart';

class UserDetailPage extends StatefulWidget {
  final User user;

  UserDetailPage({Key key, this.user}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {

  final UserDetailBloc userDetailBloc = Modular.get<UserDetailBloc>();

  @override
  void dispose() {
    userDetailBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    userDetailBloc.add(ShowUserDetailEvent(widget.user.login));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.user.login),
      ),
      body: StreamBuilder(
        stream: userDetailBloc,
        initialData: ShowUserDetailInitialState,
        builder: (context, snapshot){
          final state = userDetailBloc.state;
          if(state is ShowUserDetailInitialState) return Center(child: Text("Nada a mostrar"));
          if(state is ShowUserDetailLoadingState) return Center(child: CircularProgressIndicator());
          if(state is ShowUserDetailFailureState) return Center(child: Text(state.failure.statusMessage));
          if(state is ShowUserDetailErrorState) return Center(child: Text(state.userDetailFailure.message));
          final userDetail = (state as ShowUserDetailSuccessState).userDetail;
          return Center(
            child: Text(userDetail.name),
          );
        },
      ),
    );
  }
}
