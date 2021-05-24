import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/insert_user_repository.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

abstract class InsertUserAbstraction{
  Future<Either<Failure, UserId>> call(UserDetail userDetail);
}

class InsertUser implements InsertUserAbstraction{
  final InsertUserRepository repository;

  InsertUser(this.repository);

  @override
  Future<Either<Failure, UserId>> call(UserDetail userDetail) async {
    try{
      return userDetail == null? Left(Failure(status: "Entidade nula", statusMessage: "A entidade não pode ser nula")):
      await repository(userDetail);
    }
    on InsertUserError catch(e){
      return Left(Failure(status: "IsertUserError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}