import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
            'https://www.comfenalcoantioquia.com.co/wcm/connect/11733b3f-6812-4dbe-a616-77f36c98f664/1/49.png?MOD=AJPERES'),
        const SizedBox(height: 10),
        const Text('Elaborado por:'),
        const Text('Cristobal Zuluaga'),
        const Text('Leidy Estrada'),
        const Text('Steven Caicedo'),
      ],
    );
  }
}
