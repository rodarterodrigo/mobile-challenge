import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/delete_user_repository.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/delete_user_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';

class DeleteUserRepositoryImplementation implements DeleteUserRepository{
  final DeleteUserDatasource datasource;

  DeleteUserRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, int>> call(int userId) async{
    try{
      return await datasource(userId)..fold((l) => Left(l), (r) => Right(r));
    }
    on DeleteUserDatasourceError catch(e){
      return Left(Failure(status: "DeleteUserDatasourceError", statusMessage: e.toString()));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}