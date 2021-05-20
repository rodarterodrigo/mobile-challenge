abstract class UserDetailFailure implements Exception{
  final String message;
  UserDetailFailure(this.message);
}

class UserDetailError implements UserDetailFailure{
  @override
  final String message;
  UserDetailError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "UserDetailError": "UserDetailError: $message";
  }
}