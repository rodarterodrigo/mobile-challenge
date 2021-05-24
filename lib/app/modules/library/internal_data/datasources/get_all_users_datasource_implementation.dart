import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/get_all_users_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_detail_list_model.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/database/database.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/models/user_detail_model.dart';

class GetAllUsersDatasourceImplementation implements GetAllUsersDatasource{
  final DBProviderAbstraction dbProviderAbstraction;

  GetAllUsersDatasourceImplementation(this.dbProviderAbstraction);

  @override
  Future<Either<FailureModel, UserDetailListModel>> call() async{
    try {
      final db = await dbProviderAbstraction.database;
      var query = await db.query('library');
      var result = query.map((e) => UserDetailModel.fromJson(e)).toList();
      return Right(UserDetailListModel(users: result));
    }
    on GetAllUsersDatasourceError catch(e){
      return Left(FailureModel(status: "GetAllUsersDatasourceError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(FailureModel(status: "Exception", statusMessage: e.toString()));
    }
  }
}