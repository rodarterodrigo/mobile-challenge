import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/errors/user_detail_failure.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/usecases/show_user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/search_user_event.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_error_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_failure_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_loading_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/show_user_detail_success_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/user_detail_page_bloc.dart';
import 'package:mockito/mockito.dart';

class ShowUserDetailMock extends Mock implements ShowUserDetail{}

final usecase = ShowUserDetailMock();
final bloc = UserDetailPageBloc(usecase);


main(){
  test("Must return all states in order.", (){
    when(usecase("userLogin")).thenAnswer((realInvocation) async => Right(UserDetail()));
    expect(bloc, emitsInOrder([
      isA<ShowUserDetailLoadingState>(),
      isA<ShowUserDetailSuccessState>(),
    ]));
    bloc.add(ShowUserDetailEvent("userLogin"));
  });

  test("Must return all states in order and show error state", (){
    when(usecase("userLogin")).thenAnswer((realInvocation) async => Left(Failure()));
    expect(bloc, emitsInOrder([
      isA<ShowUserDetailLoadingState>(),
      isA<ShowUserDetailFailureState>(),
    ]));
    bloc.add(ShowUserDetailEvent("userLogin"));
  });

  test("Must return all states in order and show error exception state", (){
    when(usecase("userLogin")).thenThrow(UserDetailError());
    expect(bloc, emitsInOrder([
      isA<ShowUserDetailLoadingState>(),
      isA<ShowUserDetailErrorState>(),
    ]));
    bloc.add(ShowUserDetailEvent("userLogin"));
  });

  test("Must return all states in order and show error exception state", (){
    when(usecase("userLogin")).thenThrow(ShowUserDetailDatasourceError());
    expect(bloc, emitsInOrder([
      isA<ShowUserDetailLoadingState>(),
      isA<ShowUserDetailErrorState>(),
    ]));
    bloc.add(ShowUserDetailEvent("userLogin"));
  });
}