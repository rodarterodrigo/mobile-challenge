import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/delete_user_repository.dart';

abstract class DeleteUserAbstraction{
  Future<Either<Failure, int>> call(int userId);
}

class DeleteUser implements DeleteUserAbstraction{
  final DeleteUserRepository repository;

  DeleteUser(this.repository);

  @override
  Future<Either<Failure, int>> call(int userId) async {
    try{
      return userId == null? Left(Failure(status: "Id nulo", statusMessage: "O id não pode ser nulo")):
      await repository(userId);
    }
    on DeleteUserError catch(e){
      return Left(Failure(status: "DeleteUserError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}