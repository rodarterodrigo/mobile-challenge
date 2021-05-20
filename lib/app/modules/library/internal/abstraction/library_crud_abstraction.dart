import 'package:mobile_challenge/app/modules/user_detail/infraestructure/models/user_detail_model.dart';

abstract class LibraryCrudAbstraction{
  Future<bool> getUserByLogin(String login);
  Future<List<UserDetailModel>> getAllUsers();
  Future<int> insertUser(UserDetailModel user);
  Future<UserDetailModel> getUser(int id);
  Future<int> updateUser(UserDetailModel user);
  Future deleteUser(int id);
}