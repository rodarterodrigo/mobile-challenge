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

class UpdateUserError implements FailureLibraryDatabase{
  @override
  final String message;
  UpdateUserError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "UpdateUserError": "UpdateUserError: $message";
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