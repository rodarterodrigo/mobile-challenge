abstract class FailureLibraryDatabase implements Exception{
  final String message;
  FailureLibraryDatabase(this.message);
}

class IsertUserError implements FailureLibraryDatabase{
  @override
  final String message;
  IsertUserError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "IsertUserError": "IsertUserError: $message";
  }
}