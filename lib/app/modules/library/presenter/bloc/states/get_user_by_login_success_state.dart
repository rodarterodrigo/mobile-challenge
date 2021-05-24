import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_states.dart';

class GetUserByLoginSuccessState extends LibraryStates{
  final bool isDuplicated;

  GetUserByLoginSuccessState(this.isDuplicated);
}