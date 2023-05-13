// import 'package:flutter/material.dart';
// import 'user_model.dart';



// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _ageController = TextEditingController();

//   List<User> users = [];
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign Up'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: <Widget>[
//             //Image.network('https://www.comfenalcoantioquia.com.co/wcm/connect/11733b3f-6812-4dbe-a616-77f36c98f664/1/49.png?MOD=AJPERES'),
//             TextFormField(
//               controller: _usernameController,
//               decoration: const InputDecoration(labelText: 'Username'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your username';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your email';
//                 }
//                 if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                     .hasMatch(value)) {
//                   return 'Please enter a valid email';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: _ageController,
//               decoration: const InputDecoration(labelText: 'Age'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your age';
//                 }
//                 return null;
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   users.add(User(
//                       username: _usernameController.text,
//                       email: _emailController.text,
//                       age: _ageController.text));
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('User Registered')),
//                   );
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'user_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    int userCount = users.length;
    double ageSum = users.fold(0, (sum, user) => sum + int.parse(user.age ?? '0'));
    double ageAverage = userCount > 0 ? ageSum / userCount : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        users.add(User(
                          username: _usernameController.text,
                          email: _emailController.text,
                          age: _ageController.text,
                        ));
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User Registered')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      users.removeWhere((user) => user.username == _usernameController.text);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('User Deleted')),
                    );
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('User Count: $userCount'),
            Text('Age Average: ${ageAverage.toStringAsFixed(2)}'),
            Text('Users:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text('Username: ${user.username}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${user.email}'),
                      Text('Age: ${user.age}'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}