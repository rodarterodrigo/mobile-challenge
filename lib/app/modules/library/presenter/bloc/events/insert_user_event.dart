import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/library_events.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

class InsertUserEvent extends LibraryEvents{
  final UserDetail userDetail;
  
  InsertUserEvent(this.userDetail);
}