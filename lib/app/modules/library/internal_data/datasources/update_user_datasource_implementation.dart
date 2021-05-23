import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/update_user_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/models/user_id_model.dart';
import 'package:mobile_challenge/app/modules/library/internal_data/database/database.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

class UpdateUserDatasourceImplementation implements UpdateUserDatasource{
  final DBProviderAbstraction dbProviderAbstraction;

  UpdateUserDatasourceImplementation(this.dbProviderAbstraction);

  @override
  Future<Either<FailureModel, UserIdModel>> call(UserDetail userDetail) async{

  }
}