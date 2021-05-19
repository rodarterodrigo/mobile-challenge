import 'package:mobile_challenge/app/modules/search/domain/entities/user_detail.dart';

class UserDetailModel extends UserDetail{
  UserDetailModel({
    String login,
    String avatar_url,
    String location,
    String name,
    String bio,
  }):super(
    login: login,
    avatar_url: avatar_url,
    location: location,
    name: name,
    bio: bio,
  );

  static UserDetailModel fromJson(Map<String, dynamic> json) => json == null? null:
      UserDetailModel(
        login: json['login'],
        avatar_url: json['avatar_url'],
        location: json['location'],
        name: json['name'],
        bio: json['bio'],
      );
}