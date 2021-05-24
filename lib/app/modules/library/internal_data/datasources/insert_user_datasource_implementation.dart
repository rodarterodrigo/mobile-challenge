import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/insert_user_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_id_model.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/database/database.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/models/user_detail_model.dart';

class InsertUserDatasourceImplementation implements InsertUserDatasource{
  final DBProviderAbstraction dbProviderAbstraction;

  InsertUserDatasourceImplementation(this.dbProviderAbstraction);

  @override
  Future<Either<FailureModel, UserIdModel>> call(UserDetail userDetail) async{
    try {
      final db = await dbProviderAbstraction.database;
      var result = await db.insert('library', UserDetailModel.toJson(userDetail));
      return Right(UserIdModel(id: result));
    }
    on InsertUserDatasourceError catch(e){
      return Left(FailureModel(status: "InsertUserDatasourceError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(FailureModel(status: "Exception", statusMessage: e.toString()));
    }
  }
}