import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/library/domain/entities/user_id.dart';
import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';
import 'package:mobile_challenge/app/modules/library/domain/usecases/insert_user.dart';
import 'package:mobile_challenge/app/modules/library/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/events/favorite_user_events/favorite_user_event.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/favorite_user_bloc.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_error_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/user_detail/presentation/bloc/states/favorite_user_states/favorite_user_success_state.dart';
import 'package:mockito/mockito.dart';

class InsertUserMock extends Mock implements InsertUser{}

final usecase = InsertUserMock();
final bloc = FavoriteUserBloc(usecase);

final userDetail = UserDetail();

main(){
  test("Must return all states in order.", (){
    when(usecase(userDetail)).thenAnswer((realInvocation) async => Right(UserId()));
    expect(bloc, emitsInOrder([
      isA<FavoriteUserSuccessState>(),
    ]));
    bloc.add(FavoriteUserEvent(userDetail));
  });

  test("Must return all states in order and show error state", (){
    when(usecase(userDetail)).thenAnswer((realInvocation) async => Left(Failure()));
    expect(bloc, emitsInOrder([
      isA<FavoriteUserFailureState>(),
    ]));
    bloc.add(FavoriteUserEvent(userDetail));
  });

  test("Must return all states in order and show error exception state", (){
    when(usecase(userDetail)).thenThrow(InsertUserError());
    expect(bloc, emitsInOrder([
      isA<FavoriteUserErrorState>(),
    ]));
    bloc.add(FavoriteUserEvent(userDetail));
  });

  test("Must return all states in order and show error exception state", (){
    when(usecase(userDetail)).thenThrow(InsertUserDatasourceError());
    expect(bloc, emitsInOrder([
      isA<FavoriteUserErrorState>(),
    ]));
    bloc.add(FavoriteUserEvent(userDetail));
  });
}