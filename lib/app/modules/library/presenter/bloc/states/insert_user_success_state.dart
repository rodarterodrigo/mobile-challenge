import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_states.dart';

class InsertUserSuccessState extends LibraryStates{
  final UserId userId;

  InsertUserSuccessState(this.userId);
}