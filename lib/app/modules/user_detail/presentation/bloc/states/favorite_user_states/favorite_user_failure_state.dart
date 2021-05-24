import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_states.dart';

class FavoriteUserFailureState extends FavoriteUserStates{
  final Failure failure;

  FavoriteUserFailureState(this.failure);
}