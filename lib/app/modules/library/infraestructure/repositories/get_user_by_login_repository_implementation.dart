import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/update_user_repository.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/get_user_by_login_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';

class GetUserByLoginRepositoryImplementation implements GetUserByLoginRepository{
  final GetUserByLoginDatasource datasource;

  GetUserByLoginRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, bool>> call(String login) async{
    try{
      return await datasource(login)..fold((l) => Left(l), (r) => Right(r));
    }
    on GetUserByLoginDatasourceError catch(e){
      return Left(Failure(status: "GetUserByLoginDatasourceError", statusMessage: e.toString()));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}