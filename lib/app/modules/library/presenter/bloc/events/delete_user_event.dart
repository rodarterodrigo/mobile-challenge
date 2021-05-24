import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/library_events.dart';

class DeleteUserEvent extends LibraryEvents{
  final int userId;

  DeleteUserEvent(this.userId);
}