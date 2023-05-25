import 'package:flutter/material.dart';
import 'prefs_service.dart';
import 'user_model.dart';
import 'global_state.dart';

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
      body: Column(
        children: [
          _buildStatsSection(),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('User count: ${GlobalState.userCount}'),
          Text('Average age: ${GlobalState.avgAge.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return Expanded(
      child: Align(
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
              DataColumn(
                // Nueva columna para "Interest"
                label: Text(
                  'Interest',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: widget.users.map((User user) {
              return DataRow(
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
                  DataCell(
                    Text(user
                        .interest), // Muestra el valor de "Interest" o una cadena vacía si es nulo
                    onTap: () {
                      _showEditDialog(context, user);
                    },
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, User user) {
    final usernameController = TextEditingController(text: user.username);
    final emailController = TextEditingController(text: user.email);
    final ageController = TextEditingController(text: user.age);
    final interestController = TextEditingController(text: user.interest);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit User'),
          content: Column(
            children: <Widget>[
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(hintText: 'Age'),
              ),
              DropdownButtonFormField<String>(
                value: user.interest,
                onChanged: (String? newValue) {
                  setState(() {
                    user.interest =
                        newValue ?? ''; // Conversión de String? a String
                  });
                },
                items: [
                  'Ver TV',
                  'Hacer deporte',
                  'Caminar',
                  'Shopping',
                  'Otro'
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                decoration: const InputDecoration(
                  hintText: 'Interest',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                widget.users.remove(user);
                await PrefsService.storeUsers(widget.users);
                GlobalState.updateUserCountAndAvgAge(widget.users);
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                user.username = usernameController.text;
                user.email = emailController.text;
                user.age = ageController.text;
                user.interest = interestController.text; // Convertir a String
                await PrefsService.storeUsers(widget.users);
                GlobalState.updateUserCountAndAvgAge(widget.users);
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
