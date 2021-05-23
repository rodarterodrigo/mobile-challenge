import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/core/packages/dio_client.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/usecases/show_user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/external/datasources/show_user_detail_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/repositories/show_user_detail_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/user_detail_bloc.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/views/user_detail_page.dart';

class UserDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => DioClientImplementation(i())),
    Bind((i) => ShowUserDetailDatasourceImplementation(i())),
    Bind((i) => ShowUserDetailRepositoryImplementation(i())),
    Bind((i) => ShowUserDetail(i())),
    Bind((i) => UserDetailBloc(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/userdetail", child: (context, args) => UserDetailPage(user: args.data)),
  ];
}