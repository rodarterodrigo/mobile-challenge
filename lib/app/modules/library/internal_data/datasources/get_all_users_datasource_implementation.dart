import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/get_all_users_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_detail_list_model.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/database/database.dart';

class GetAllUsersDatasourceImplementation implements GetAllUsersDatasource{
  final DBProviderAbstraction dbProviderAbstraction;

  GetAllUsersDatasourceImplementation(this.dbProviderAbstraction);

  @override
  Future<Either<FailureModel, UserDetailListModel>> call() async{
    try {
      final db = await dbProviderAbstraction.database;
      var query = await db.query('library');
      var result = query != null? (query as List).map((e) => UserDetailListModel.fromJson(e)).toList(): UserDetailList();
      db.close();
      return Right(result);
    }
    on GetAllUsersDatasourceError catch(e){
      return Left(FailureModel(status: "GetAllUsersDatasourceError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(FailureModel(status: "Exception", statusMessage: e));
    }
  }
}