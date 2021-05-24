import 'package:mobile_challenge/app/modules/library/presenter/bloc/events/library_events.dart';

class GetUserByLoginEvent extends LibraryEvents{
  final String login;

  GetUserByLoginEvent(this.login);
}