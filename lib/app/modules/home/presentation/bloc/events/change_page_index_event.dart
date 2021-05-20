import 'package:mobile_challenge/app/modules/home/presentation/bloc/events/page_index_events.dart';

class ChangePageIndexEvent extends PageIndexEvents{
  final int index;

  ChangePageIndexEvent(this.index);
}