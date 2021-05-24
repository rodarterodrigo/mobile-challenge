import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/favorite_user_events/favorite_user_events.dart';

class FavoriteUserEvent extends FavoriteUserEvents{
  final UserDetail userDetail;

  FavoriteUserEvent(this.userDetail);
}