import 'package:mobile_challenge/app/core/shared/domain/entities/failure.dart';

class FailureModel extends Failure{
  FailureModel({status, statusMessage}):super(status: status, statusMessage: statusMessage);
}