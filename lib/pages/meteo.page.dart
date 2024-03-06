import 'package:flutter/material.dart';

class MeteoPage extends StatelessWidget {
  const MeteoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meteo Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[200],
      ),
      body: Center(
        child: Text('la page de météo'),
      ),
    );
  }
}
