import 'package:mobile_challenge/app/modules/user_detail/domain/entities/user_detail.dart';

class UserDetailModel extends UserDetail{
  UserDetailModel({
    int id,
    String login,
    String avatarUrl,
    String location,
    String name,
    String bio,
  }):super(
    id: id,
    login: login,
    avatarUrl: avatarUrl,
    location: location,
    name: name,
    bio: bio,
  );

  static UserDetailModel fromJson(Map<String, dynamic> json) => json == null? null:
      UserDetailModel(
        id: json['id'],
        login: json['login'],
        avatarUrl: json['avatar_url'],
        location: json['location'],
        name: json['name'],
        bio: json['bio'],
      );

  static Map<String, dynamic> toJson(UserDetail userDetail){
    return{
      "id": userDetail.id,
      "login": userDetail.login,
      "location": userDetail.location,
      "name": userDetail.name,
      "bio": userDetail.bio,
    };
  }
}