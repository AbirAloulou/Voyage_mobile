import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/authentification.page.dart';
import '../pages/home.page.dart';
import '../pages/inscription.page.dart';
import '../pages/meteo.page.dart';
import '../pages/contact.page.dart';
import '../pages/gallerie.page.dart';
import '../pages/parametres.page.dart';
import '../pages/pays.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/inscription': (context) => InscriptionPage(),
      '/login': (context) => AuthentificationPage(),
      '/home': (context) => HomePage(),
      '/meteo': (context) => MeteoPage(),
      '/contact': (context) => ContactPage(),
      '/gallerie': (context) => GalleriePage(),
      '/parametres': (context) => ParametresPage(),
      '/pays': (context) => PaysPage(),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            bool conn = snapshot.data!.getBool('connecte') ??
                false; // data! bech t9olo rani met2aked li data mahiyech null
            if (conn) return HomePage();
          }
          return InscriptionPage();
        },
      ),
    ); // MaterialApp
  }
}
