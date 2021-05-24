abstract class FailureLibraryDatabase implements Exception{
  final String message;
  FailureLibraryDatabase(this.message);
}

class InsertUserError implements FailureLibraryDatabase{
  @override
  final String message;
  InsertUserError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "IsertUserError": "IsertUserError: $message";
  }
}

class GetUserByLoginError implements FailureLibraryDatabase{
  @override
  final String message;
  GetUserByLoginError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "GetUserByLoginError": "GetUserByLoginError: $message";
  }
}

class DeleteUserError implements FailureLibraryDatabase{
  @override
  final String message;
  DeleteUserError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "DeleteUserError": "DeleteUserError: $message";
  }
}

class GetAllUsersError implements FailureLibraryDatabase{
  @override
  final String message;
  GetAllUsersError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "GetAllUsersError": "GetAllUsersError: $message";
  }
}