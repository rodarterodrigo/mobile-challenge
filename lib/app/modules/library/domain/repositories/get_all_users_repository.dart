import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';

abstract class GetAllUsersRepository{
  Future<Either<Failure, UserDetailList>> call();
}