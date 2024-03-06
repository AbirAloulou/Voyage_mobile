import 'package:flutter/material.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paramètres Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[200],
      ),
      body: Center(
        child: Text('la page de paramètres'),
      ),
    );
  }
}
