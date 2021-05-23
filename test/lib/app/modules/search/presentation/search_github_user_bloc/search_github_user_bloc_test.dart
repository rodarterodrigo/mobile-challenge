import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';
import 'package:mobile_challenge/app/modules/search/domain/errors/failure_search.dart';
import 'package:mobile_challenge/app/modules/search/domain/usecases/search_github_user.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/events/search_github_user_event.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/search_github_user_bloc.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_error_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_failure_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_loading_state.dart';
import 'package:mobile_challenge/app/modules/search/presentation/bloc/states/search_github_user_success_state.dart';
import 'package:mockito/mockito.dart';

class SearchGithubUserMock extends Mock implements SearchGithubUser{}

final usecase = SearchGithubUserMock();
final bloc = SearchGithubUserBloc(usecase);


main(){
  test("Must return all states in order.", (){
    when(usecase("query", 10, 1)).thenAnswer((realInvocation) async => Right(UsersList()));
    expect(bloc, emitsInOrder([
      isA<SearchGithubUserSuccessState>(),
    ]));
    bloc.add(SearchGithubUserEvent("query", 10, 1));
  });

  test("Must return all states in order and show error state", (){
    when(usecase("query", 10, 1)).thenAnswer((realInvocation) async => Left(Failure()));
    expect(bloc, emitsInOrder([
      isA<SearchGithubUserFailureState>(),
    ]));
    bloc.add(SearchGithubUserEvent("query", 10, 1));
  });

  test("Must return all states in order and show error exception state", (){
    when(usecase("query", 10, 1)).thenThrow(SearchError());
    expect(bloc, emitsInOrder([
      isA<SearchGithubUserErrorState>(),
    ]));
    bloc.add(SearchGithubUserEvent("query", 10, 1));
  });

  test("Must return all states in order and show error exception state", (){
    when(usecase("query", 10, 1)).thenThrow(SearchGithubUserDatasourceError());
    expect(bloc, emitsInOrder([
      isA<SearchGithubUserErrorState>(),
    ]));
    bloc.add(SearchGithubUserEvent("query", 10, 1));
  });
}