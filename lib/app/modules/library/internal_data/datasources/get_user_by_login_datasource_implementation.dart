import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/get_user_by_login_datasource.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/database/database.dart';

class GetUserByLoginDatasourceImplementation implements GetUserByLoginDatasource{
  final DBProviderAbstraction dbProviderAbstraction;

  GetUserByLoginDatasourceImplementation(this.dbProviderAbstraction);

  @override
  Future<Either<FailureModel, bool>> call(String login) async {
    try {
      final db = await DBProvidder.db.database;
      List<Map<dynamic, dynamic>> res =
      await db.query('library', where: 'login = ?', whereArgs: [login]);
      if (res.isNotEmpty) {
        return Right(true);
      }
      else {
        return Right(false);
      }
    }
    on GetUserByLoginError catch(e){
      return Left(FailureModel(status: "GetUserByLoginError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(FailureModel(status: "Exception", statusMessage: e.toString()));
    }
  }
}