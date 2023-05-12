import 'package:flutter/material.dart';
import 'sign_up_page.dart'; // import the sign_up_page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Registration App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage(), // Use SignUpPage as the home page
    );
  }
}
