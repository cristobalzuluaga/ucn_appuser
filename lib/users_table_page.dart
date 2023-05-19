import 'package:flutter/material.dart';
import 'prefs_service.dart';
import 'user_model.dart';

class UsersTablePage extends StatefulWidget {
  final List<User> users;

  const UsersTablePage({Key? key, required this.users}) : super(key: key);

  @override
  _UsersTablePageState createState() => _UsersTablePageState();
}

class _UsersTablePageState extends State<UsersTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Table'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Username',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Email',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Age',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: widget.users
                .map((User user) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(user.username),
                          onTap: () {
                            _showEditDialog(context, user);
                          },
                        ),
                        DataCell(
                          Text(user.email),
                          onTap: () {
                            _showEditDialog(context, user);
                          },
                        ),
                        DataCell(
                          Text(user.age),
                          onTap: () {
                            _showEditDialog(context, user);
                          },
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, User user) {
    final usernameController = TextEditingController(text: user.username);
    final emailController = TextEditingController(text: user.email);
    final ageController = TextEditingController(text: user.age);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: Column(
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(hintText: 'Age'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Delete'),
              onPressed: () async {
                widget.users.remove(user);
                await PrefsService.storeUsers(widget.users);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                user.username = usernameController.text;
                user.email = emailController.text;
                user.age = ageController.text;
                await PrefsService.storeUsers(widget.users);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
