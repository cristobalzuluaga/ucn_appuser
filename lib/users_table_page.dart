import 'package:flutter/material.dart';
import 'user_model.dart';

class UsersTablePage extends StatelessWidget {
  final List<User> users;

  const UsersTablePage({Key? key, required this.users}) : super(key: key);

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
            rows: users
                .map((User user) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(user.username)),
                        DataCell(Text(user.email)),
                        DataCell(Text(user.age)),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
