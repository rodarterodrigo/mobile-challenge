import 'package:mobile_challenge/app/modules/search/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    String login,
    String avatarUrl,
  }):super(
    login: login,
    avatarUrl: avatarUrl,
  );

  static UserModel fromJson(Map<String, dynamic> json) => json == null? null:
      UserModel(
        login: json['login'],
        avatarUrl: json['avatar_url'],
      );
}