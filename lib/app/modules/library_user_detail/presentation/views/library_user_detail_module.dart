import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile_challenge/app/core/packages/dio_client.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/delete_user.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/repositories/delete_user_repository_implementation.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/datasources/delete_user_datasource_implementation.dart';
import 'package:mobile_challenge/app/modules/library_user_detail/presentation/views/library_user_detail_page.dart';

class LibraryUserDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => DioClientImplementation(i())),
    Bind((i) => DeleteUserDatasourceImplementation(i())),
    Bind((i) => DeleteUserRepositoryImplementation(i())),
    Bind((i) => DeleteUser(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/libraryuserdetail", child: (context, args) => LibraryUserDetailPage(userDetail: args.data)),
  ];
}