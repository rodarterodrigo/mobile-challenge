import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/events/change_page_index_event.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:mobile_challenge/app/modules/home/presentation/bloc/states/change_page_index_state.dart';

main() {

  final bloc = HomeBloc();

  test("Must return the states in order", () {
    expect(bloc, emitsInOrder([
      isA<ChangePageIndexState>(),
    ]));
    bloc.add(ChangePageIndexEvent(1));
  });
}