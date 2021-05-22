import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/get_all_users_repository.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/datasources/get_all_users_datasource.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';

class GetAllUsersRepositoryImplementation implements GetAllUsersRepository{
  final GetAllUsersDatasource datasource;

  GetAllUsersRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, UserDetailList>> call() async{
    try{
      return await datasource()..fold((l) => Left(l), (r) => Right(r));
    }
    on GetAllUsersDatasourceError catch(e){
      return Left(Failure(status: "GetAllUsersDatasourceError", statusMessage: e.toString()));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}