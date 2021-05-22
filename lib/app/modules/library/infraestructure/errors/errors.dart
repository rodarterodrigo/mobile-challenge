import 'package:mobile_challenge/app/modules/library/domain/errors/failure_library_database.dart';

class InsertUserDatasourceError implements FailureLibraryDatabase{
  @override
  final String message;
  InsertUserDatasourceError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "InsertUserDatasourceError": "InsertUserDatasourceError: $message";
  }
}

class UpdateUserDatasourceError implements FailureLibraryDatabase{
  @override
  final String message;
  UpdateUserDatasourceError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "UpdateUserDatasourceError": "UpdateUserDatasourceError: $message";
  }
}