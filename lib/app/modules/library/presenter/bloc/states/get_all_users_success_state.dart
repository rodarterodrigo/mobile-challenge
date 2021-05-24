import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/library/presenter/bloc/states/library_states.dart';

class GetAllUsersSuccessState extends LibraryStates{
  final UserDetailList userDetailList;

  GetAllUsersSuccessState(this.userDetailList);
}