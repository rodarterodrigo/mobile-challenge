import 'package:mobile_challenge/app/modules/user_detail/domain/errors/user_detail_failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_states.dart';

class ShowUserDetailErrorState extends ShowUserDetailStates{
  final UserDetailFailure userDetailFailure;

  ShowUserDetailErrorState(this.userDetailFailure);
}