import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';
import 'global_state.dart';

class PrefsService {
  static Future<void> storeUsers(List<User> users) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = users.map((user) => user.toJson()).toList();
    await prefs.setString('users', jsonEncode(usersJson));
    GlobalState.updateUserCountAndAvgAge(users);
  }

  static Future<List<User>> retrieveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    if (usersJson == null) {
      return [];
    }

    final usersList = jsonDecode(usersJson) as List;
    return usersList.map((userJson) => User.fromJson(userJson)).toList();
  }

  static Future<void> deleteUser(User user) async {
    final users = await retrieveUsers();
    users.removeWhere(
        (u) => u.username == user.username && u.email == user.email);
    await storeUsers(users);
  }

  static Future<void> updateUser(User oldUser, User newUser) async {
    final users = await retrieveUsers();
    final index = users.indexWhere(
        (u) => u.username == oldUser.username && u.email == oldUser.email);
    if (index != -1) {
      users[index] = newUser;
      await storeUsers(users);
    }
  }
}
