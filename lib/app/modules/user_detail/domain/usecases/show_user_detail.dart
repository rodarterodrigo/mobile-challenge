import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/errors/user_detail_failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/repositories/show_user_detail_repository.dart';

abstract class ShowUserDetailAbstraction{
  Future<Either<Failure, UserDetail>> call(String userLogin);
}

class ShowUserDetail implements ShowUserDetailAbstraction{
  final ShowUserDetailRepository repository;

  ShowUserDetail(this.repository);

  @override
  Future<Either<Failure, UserDetail>> call(String userLogin) async {
    try{
      return userLogin == null? Left(Failure(status: "Parametro nulo", statusMessage: "O parametro não pode ser nulo")):
      userLogin.isEmpty? Left(Failure(status: "Parametro vazio", statusMessage: "O parametro não pode ser vazio")):
      await repository(userLogin);
    }
    on UserDetailError catch(e){
      return Left(Failure(status: "UserDetailError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(Failure(status: "Exception", statusMessage: e.toString()));
    }
  }
}