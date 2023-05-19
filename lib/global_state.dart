import 'user_model.dart';

class GlobalState {
  static int userCount = 0;
  static double avgAge = 0.0;

  static void updateUserCountAndAvgAge(List<User> users) {
    userCount = users.length;
    avgAge = users.isEmpty
        ? 0
        : users.map((user) => int.parse(user.age)).reduce((a, b) => a + b) /
            users.length;
  }
}
