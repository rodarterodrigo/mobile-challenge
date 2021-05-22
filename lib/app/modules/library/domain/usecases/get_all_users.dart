import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/get_all_users_repository.dart';

abstract class GetAllUsersAbstraction{
  Future<Either<Failure, UserDetailList>> call();
}

class GetAllUsers implements GetAllUsersAbstraction{
  final GetAllUsersRepository repository;

  GetAllUsers(this.repository);

  @override
  Future<Either<Failure, UserDetailList>> call() async {
    try{
      return await repository();
    }
    on GetAllUsersError catch(e){
      return Left(Failure(status: "GetAllUsersError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}