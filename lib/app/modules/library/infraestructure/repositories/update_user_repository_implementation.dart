import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/update_user_repository.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/update_user_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

class UpdateUserRepositoryImplementation implements UpdateUserRepository{
  final UpdateUserDatasource datasource;

  UpdateUserRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, int>> call(UserDetail userDetail) async{
    try{
      return await datasource(userDetail)..fold((l) => Left(l), (r) => Right(r));
    }
    on UpdateUserDatasourceError catch(e){
      return Left(Failure(status: "UpdateUserDatasourceError", statusMessage: e.toString()));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}