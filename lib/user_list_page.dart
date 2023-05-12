import 'package:flutter/material.dart';
import 'user_model.dart';

class UserListPage extends StatelessWidget {
  final List<User> users;

  const UserListPage({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                "${users[index].username} ${users[index].email} ${users[index].age}"),
          );
        },
      ),
    );
  }
}
