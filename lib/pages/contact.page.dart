import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[200],
      ),
      body: Center(
        child: Text('la page de contact'),
      ),
    );
  }
}
