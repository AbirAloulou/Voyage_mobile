import 'package:flutter/material.dart';

class GalleriePage extends StatelessWidget {
  const GalleriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallerie Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[200],
      ),
      body: Center(
        child: Text('la page de gallerie'),
      ),
    );
  }
}
