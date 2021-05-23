import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/core/shared/widgets/custom_buttom.dart';
import 'package:mobile_challenge/app/core/shared/widgets/enums/button_style.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/user.dart';
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
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Modular.to.pop()),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(132),
                              child: CachedNetworkImage(
                                height: MediaQuery.of(context).size.height/3,
                                imageUrl: userDetail.avatarUrl, fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(userDetail.name?? ""),
                                  Text(userDetail.location?? ""),
                                  Text(userDetail.bio?? ""),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          onPressed: () => Modular.to.pop(),
                          text: "Voltar",
                          buttonStyle: CustomButtonStyle.Secondary),
                      CustomButton(
                          onPressed: () => Modular.to.pop(),
                          text: "Favorito",
                          buttonStyle: CustomButtonStyle.Primary),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}