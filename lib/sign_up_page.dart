import 'package:flutter/material.dart';
import 'user_model.dart';
import 'prefs_service.dart';
import 'global_state.dart';

class SignUpPage extends StatefulWidget {
  final List<User> users;

  const SignUpPage({Key? key, required this.users}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _interestController = TextEditingController();
  String _selectedInterest = 'Ver TV'; // Valor predeterminado seleccionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Column(
        children: [
          _buildStatsSection(),
          _buildForm(),
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

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              hintText: 'Username',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              hintText: 'Age',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your age';
              }
              return null;
            },
          ),
          DropdownButtonFormField<String>(
            value: _selectedInterest,
            decoration: const InputDecoration(
              hintText: 'Interests',
            ),
            items: <String>[
              'Ver TV',
              'Hacer deporte',
              'Caminar',
              'Shopping',
              'Otro',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedInterest = newValue!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  widget.users.add(User(
                    username: _usernameController.text,
                    email: _emailController.text,
                    age: _ageController.text,
                    interest: _selectedInterest,
                  ));
                });

                // Store updated user list in shared preferences
                await PrefsService.storeUsers(widget.users);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User Registered')),
                );

                _usernameController.clear();
                _emailController.clear();
                _ageController.clear();
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
