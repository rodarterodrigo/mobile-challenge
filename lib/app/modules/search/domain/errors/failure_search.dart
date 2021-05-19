abstract class FailureSearch implements Exception{
  final String message;
  FailureSearch(this.message);
}

class SearchError implements FailureSearch{
  @override
  final String message;
  SearchError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "SearchError": "SearchError: $message";
  }
}