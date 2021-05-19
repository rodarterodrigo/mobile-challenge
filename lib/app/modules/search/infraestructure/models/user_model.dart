import 'package:mobile_challenge/app/modules/search/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    String login,
    String avatar_url,
  }):super(
    login: login,
    avatar_url: avatar_url,
  );

  static UserModel fromJson(Map<String, dynamic> json) => json == null? null:
      UserModel(
        login: json['login'],
        avatar_url: json['avatar_url'],
      );
}