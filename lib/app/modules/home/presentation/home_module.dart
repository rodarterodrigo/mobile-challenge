import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/core/packages/dio_client.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:mobile_challenge/app/modules/home/presentation/home_page.dart';
import 'package:mobile_challenge/app/modules/search/domain/usecases/search_github_user.dart';
import 'package:mobile_challenge/app/modules/search/external/datasources/search_github_user_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/repositories/search_github_user_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/search_github_user_bloc.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/views/user_detail_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => DioClientImplementation(i())),
    Bind((i) => SearchGithubUserDatasourceImplementation(i())),
    Bind((i) => SearchGithubUserRepositoryImplementation(i())),
    Bind((i) => SearchGithubUser(i())),
    Bind((i) => SearchGithubUserBloc(i())),
    Bind((i) => HomeBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => HomePage()),
    ModuleRoute("/userdetail", module: UserDetailModule(), transition: TransitionType.rightToLeft)
  ];
}