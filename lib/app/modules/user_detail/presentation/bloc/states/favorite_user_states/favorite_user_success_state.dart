import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_states.dart';

class FavoriteUserSuccessState extends FavoriteUserStates{
  final UserId userId;

  FavoriteUserSuccessState(this.userId);
}