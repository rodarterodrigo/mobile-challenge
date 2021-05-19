import 'package:mobile_challenge/app/modules/search/domain/errors/failure_search.dart';

class SearchGithubUserDatasourceError implements FailureSearch{
  @override
  final String message;
  SearchGithubUserDatasourceError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "SearchGithubUserDatasourceError": "SearchGithubUserDatasourceError: $message";
  }
}