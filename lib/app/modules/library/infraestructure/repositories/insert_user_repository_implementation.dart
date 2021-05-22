import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/insert_user_repository.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/insert_user_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

class InsertUserRepositoryImplementation implements InsertUserRepository{
  final InsertUserDatasource datasource;

  InsertUserRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, int>> call(UserDetail userDetail) async{
    try{
      return await datasource(userDetail)..fold((l) => Left(l), (r) => Right(r));
    }
    on InsertUserDatasourceError catch(e){
      return Left(Failure(status: "InsertUserDatasourceError", statusMessage: e.toString()));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}