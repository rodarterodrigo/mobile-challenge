import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_states.dart';

class ShowUserDetailSuccessState extends ShowUserDetailStates{
  final UserDetail userDetail;

  ShowUserDetailSuccessState(this.userDetail);
}