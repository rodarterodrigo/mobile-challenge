import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/core/packages/dio_client.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:mobile_challenge/app/modules/home/presentation/home_page.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/delete_user.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_all_users.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/get_user_by_login.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/insert_user.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/delete_user_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/get_all_users_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/insert_user_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/get_user_by_login_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/database/database.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/datasources/delete_user_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/datasources/get_all_users_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/datasources/get_user_by_login_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/datasources/insert_user_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/library_bloc.dart';
import 'package:mobile_challenge/app/modules/search/domain/usecases/search_github_user.dart';
import 'package:mobile_challenge/app/modules/search/external/datasources/search_github_user_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/repositories/search_github_user_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/helpers/search_bloc_methods_helper.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/search_github_user_bloc.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/views/user_detail_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => DioClientImplementation(i())),
    Bind((i) => DBProvidder()),
    Bind((i) => GetAllUsersDatasourceImplementation(i())),
    Bind((i) => GetAllUsersRepositoryImplementation(i())),
    Bind((i) => GetAllUsers(i())),
    Bind((i) => InsertUserDatasourceImplementation(i())),
    Bind((i) => InsertUserRepositoryImplementation(i())),
    Bind((i) => InsertUser(i())),
    Bind((i) => DeleteUserDatasourceImplementation(i())),
    Bind((i) => DeleteUserRepositoryImplementation(i())),
    Bind((i) => DeleteUser(i())),
    Bind((i) => GetUserByLoginDatasourceImplementation(i())),
    Bind((i) => GetUserByLoginRepositoryImplementation(i())),
    Bind((i) => GetUserByLogin(i())),
    Bind((i) => LibraryBloc(i(), i(), i(), i())),
    Bind((i) => SearchGithubUserDatasourceImplementation(i())),
    Bind((i) => SearchGithubUserRepositoryImplementation(i())),
    Bind((i) => SearchGithubUser(i())),
    Bind((i) => SearchGithubUserBloc(i())),
    Bind((i) => SearchBlocMethodsHelper(i())),
    Bind((i) => HomeBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => HomePage()),
    ModuleRoute("/userdetail", module: UserDetailModule(), transition: TransitionType.rightToLeft)
  ];
}