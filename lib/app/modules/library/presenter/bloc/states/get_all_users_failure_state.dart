import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_states.dart';

class GetAllUsersFailureState extends LibraryStates{
  final Failure failure;

  GetAllUsersFailureState(this.failure);
}