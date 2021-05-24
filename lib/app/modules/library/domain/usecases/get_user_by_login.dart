import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/repositories/update_user_repository.dart';

abstract class UpdateUserAbstraction{
  Future<Either<Failure, bool>> call(String login);
}

class GetUserByLogin implements UpdateUserAbstraction{
  final GetUserByLoginRepository repository;

  GetUserByLogin(this.repository);

  @override
  Future<Either<Failure, bool>> call(String login) async {
    try{
      return login == null? Left(Failure(status: "Parametro nulo", statusMessage: "O parametro não pode ser nulo")):
      await repository(login);
    }
    on GetUserByLoginError catch(e){
      return Left(Failure(status: "GetUserByLoginError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}