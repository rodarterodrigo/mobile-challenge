import 'package:bloc/bloc.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/events/change_page_index_event.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/events/page_index_events.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/states/change_page_index_state.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/states/page_index_states.dart';

class HomeBloc extends Bloc<PageIndexEvents, PageIndexStates>{
  HomeBloc() : super(ChangePageIndexState());

  int index = 0;

  @override
  Stream<PageIndexStates> mapEventToState(PageIndexEvents event) async*{
    if(event is ChangePageIndexEvent) yield* _mapIndexPageToState(event);
  }

  Stream<PageIndexStates> _mapIndexPageToState(ChangePageIndexEvent event) async* {
    this.index = event.index;
    yield ChangePageIndexState();
  }
}