import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/delete_user_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_id_model.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/database/database.dart';

class DeleteUserDatasourceImplementation implements DeleteUserDatasource{
  final DBProviderAbstraction dbProviderAbstraction;

  DeleteUserDatasourceImplementation(this.dbProviderAbstraction);

  @override
  Future<Either<FailureModel, UserIdModel>> call(int userId) async{
    try {
      final db = await dbProviderAbstraction.database;
      await db.delete('library', where: 'id = ?', whereArgs: [userId]);
      return Right(UserIdModel(id: userId));
    }
    on DeleteUserDatasourceError catch(e){
      return Left(FailureModel(status: "DeleteUserDatasourceError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(FailureModel(status: "Exception", statusMessage: e.toString()));
    }
  }
}