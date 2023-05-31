import 'package:flutter/material.dart';
import 'global_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('User count: ${GlobalState.userCount}'),
                Text('Average age: ${GlobalState.avgAge.toStringAsFixed(2)}'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Image.network(
              'https://www.comfenalcoantioquia.com.co/wcm/connect/11733b3f-6812-4dbe-a616-77f36c98f664/1/49.png?MOD=AJPERES'),
          const SizedBox(height: 10),
          const Text('Elaborado por:'),
          const Text('Cristobal Zuluaga'),
          const Text('Leidy Estrada'),
          const Text('Steven Caicedo'),
        ],
      ),
    );
  }
}
