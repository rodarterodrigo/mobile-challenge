import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/user_detail_events/show_user_detail_events.dart';

class ShowUserDetailEvent extends ShowUserDetailEvents{
  final String userLogin;

  ShowUserDetailEvent(this.userLogin);
}