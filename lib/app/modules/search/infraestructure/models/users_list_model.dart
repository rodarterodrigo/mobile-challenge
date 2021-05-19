import 'package:mobile_challenge/app/modules/search/domain/entities/user.dart';
import 'package:mobile_challenge/app/modules/search/domain/entities/users_list.dart';
import 'package:mobile_challenge/app/modules/search/infraestructure/models/user_model.dart';

class UsersListModel extends UsersList{
  UsersListModel({
      List<User> users,
  }):super(
    users: users,
  );

  static UsersListModel fromJson(Map<String, dynamic> json) => json == null? null:
    UsersListModel(
      users: json['items'] != []? (json['items'] as List).map((e) => UserModel.fromJson(json)).toList(): []
    );
}