import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

class UserDetailModel extends UserDetail{
  UserDetailModel({
    String login,
    String avatarUrl,
    String location,
    String name,
    String bio,
  }):super(
    login: login,
    avatarUrl: avatarUrl,
    location: location,
    name: name,
    bio: bio,
  );

  static UserDetailModel fromJson(Map<String, dynamic> json) => json == null? null:
      UserDetailModel(
        login: json['login'],
        avatarUrl: json['avatar_url'],
        location: json['location'],
        name: json['name'],
        bio: json['bio'],
      );
}