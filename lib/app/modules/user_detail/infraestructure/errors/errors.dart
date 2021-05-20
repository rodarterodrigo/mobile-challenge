import 'package:mobile_challenge/app/modules/user_detail/domain/errors/user_detail_failure.dart';

class ShowUserDetailDatasourceError implements UserDetailFailure{
  @override
  final String message;
  ShowUserDetailDatasourceError({this.message});

  String toString() {
    Object message = this.message;
    return message == null? "ShowUserDetailDatasourceError": "ShowUserDetailDatasourceError: $message";
  }
}