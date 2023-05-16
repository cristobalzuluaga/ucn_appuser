import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';

class PrefsService {
  static Future<void> storeUsers(List<User> users) async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = users.map((user) => user.toJson()).toList();
    await prefs.setString('users', jsonEncode(usersJson));
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
}
