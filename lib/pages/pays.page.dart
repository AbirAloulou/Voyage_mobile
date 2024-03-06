import 'package:flutter/material.dart';

class PaysPage extends StatelessWidget {
  const PaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pays Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[200],
      ),
      body: Center(
        child: Text('la page de pays'),
      ),
    );
  }
}
