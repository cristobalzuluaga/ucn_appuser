import 'package:flutter/material.dart';
import 'home_page.dart';
import 'sign_up_page.dart';
import 'users_table_page.dart';
import 'user_model.dart';
import 'prefs_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UsersData(),
    );
  }
}

class UsersData extends StatefulWidget {
  const UsersData({Key? key}) : super(key: key);

  @override
  _UsersDataState createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersData> {
  List<User> users = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    List<User> storedUsers = await PrefsService.retrieveUsers();
    setState(() {
      users = storedUsers;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const HomePage(),
      SignUpPage(users: users),
      UsersTablePage(users: users),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('UCN App users'),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(Icons.table_chart),
            label: 'Users',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
