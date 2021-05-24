import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_states.dart';

class FavoriteUserErrorState extends FavoriteUserStates{
  final FailureLibraryDatabase failureLibraryDatabase;

  FavoriteUserErrorState(this.failureLibraryDatabase);
}