import 'package:dartz/dartz.dart';
import 'package:mobile_challenge/app/core/packages/dio_client.dart';
import 'package:mobile_challenge/app/core/shared/infraestructure/models/failure_model.dart';
import 'package:mobile_challenge/app/modules/user_detail/external/settings/settings.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/datasources/show_user_detail_datasource.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/errors/errors.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/models/user_detail_model.dart';

class ShowUserDetailDatasourceImplementation implements ShowUserDetailDatasource{
  final DioClient dio;

  ShowUserDetailDatasourceImplementation(this.dio);

  @override
  Future<Either<FailureModel, UserDetailModel>> call(String userLogin) async{
    try {
      final response = await dio.get(Settings.userDetailUrl + userLogin);

      if (response.statusCode != 200)
        throw ShowUserDetailDatasourceError(
            message: "Status code : ${response.statusCode}");
      else
        return Right(UserDetailModel.fromJson(response.data));
    }
    on ShowUserDetailDatasourceError catch(e){
      return Left(FailureModel(status: "ShowUserDetailDatasourceError", statusMessage: e.message));
    }
    on Exception catch(e){
      return Left(FailureModel(status: "Exception", statusMessage: e.toString()));
    }
  }
}