import 'package:mobile_challenge/app/modules/search/domain/entities/failure.dart';

class FailureModel extends Failure{
  FailureModel({status, statusMessage}):super(status: status, statusMessage: statusMessage);
}