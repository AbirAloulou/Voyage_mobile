import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';
import 'package:voyage/firebase_options.dart';
import '../pages/authentification.page.dart';
import '../pages/home.page.dart';
import '../pages/inscription.page.dart';
import '../pages/meteo.page.dart';
import '../pages/contact.page.dart';
import '../pages/gallerie.page.dart';
import '../pages/parametres.page.dart';
import '../pages/pays.page.dart';
import 'pages/priere.page.dart';

ThemeData theme = ThemeData.light();
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //theme = (await _onGetMode() == "Jour")? ThemeData.light() : ThemeData.dark();
  GlobalParams.themeActuel.setMode(await _onGetMode());
  runApp(MyApp());
}

Future<String> _onGetMode() async {
  final snapshot = await ref.child('mode').get();
  if (snapshot.exists)
    mode = snapshot.value.toString();
  else
    mode = "Jour";
  print(mode);
  return (mode);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/inscription': (context) => InscriptionPage(),
      '/login': (context) => AuthentificationPage(),
      '/home': (context) => HomePage(),
      '/meteo': (context) => MeteoPage(),
      '/gallerie': (context) => GalleriePage(),
      '/pays': (context) => PaysPage(),
      '/contact': (context) => ContactPage(),
      '/parametres': (context) => ParametrePage(),
      '/priere': (context) => PrierePage(),
    };
    return MaterialApp(
      theme: GlobalParams.themeActuel.getTheme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return HomePage();
            else
              return InscriptionPage();
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    GlobalParams.themeActuel.addListener(() {
      setState(() {});
    });
  }
}
