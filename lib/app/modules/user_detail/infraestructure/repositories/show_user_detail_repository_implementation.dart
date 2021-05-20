import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/repositories/show_user_detail_repository.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/datasources/show_user_detail_datasource.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/errors/errors.dart';

class ShowUserDetailRepositoryImplementation implements ShowUserDetailRepository{
  final ShowUserDetailDatasource datasource;

  ShowUserDetailRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, UserDetail>> call(String userLogin) async{
    try{
      return await datasource(userLogin)..fold((l) => Left(l), (r) => Right(r));
    }
    on ShowUserDetailDatasourceError catch(e){
      return Left(Failure(status: "ShowUserDetailDatasourceError", statusMessage: e.toString()));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}