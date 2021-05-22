import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_states.dart';

class ShowUserDetailFailureState extends ShowUserDetailStates{
  final Failure failure;

  ShowUserDetailFailureState(this.failure);
}