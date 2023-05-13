import 'package:flutter/material.dart';
import 'sign_up_page.dart'; // import the sign_up_page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(), // Home Page
    const SignUpPage(), // Register Page
    const ConsultingPage(), // Consulting Page
    const ModifyPage(), // Modify Page
    const DeletePage(), // Delete Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('UCN App users'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Set the type to fixed
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Register',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Consulting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_emergency),
            label: 'Modify',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Delete',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Home Page'),
    );
  }
}

class ConsultingPage extends StatelessWidget {
  const ConsultingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Consulting Page'),
    );
  }
}

class ModifyPage extends StatelessWidget {
  const ModifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Modify Page'),
    );
  }
}

class DeletePage extends StatelessWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Delete Page'),
    );
  }
}
