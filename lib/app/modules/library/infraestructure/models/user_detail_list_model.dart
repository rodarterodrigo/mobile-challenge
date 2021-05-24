import 'package:mobile_challenge/app/modules/library/domain/entities/user_detail_list.dart';
import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';
import 'package:mobile_challenge/app/modules/user_detail/infraestructure/models/user_detail_model.dart';

class UserDetailListModel extends UserDetailList{
  UserDetailListModel({
    List<UserDetail> users,
  }):super(
    users: users,
  );

  static UserDetailListModel fromJson(Map<dynamic, dynamic> json) => json == null? null:
      UserDetailListModel(
        users: (json as List).map((e) => UserDetailModel.fromJson(e)).toList(),
      );
}