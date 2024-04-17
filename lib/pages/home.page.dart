import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/global.params.dart';
import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text(
            'Home Page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 199, 207, 254),
        ),
        body: Center(
          child: Wrap(
            children: [
              //méthode 1
              // InkWell(
              //   child: Ink.image(
              //     height: 180,
              //     width: 180,
              //     image: const AssetImage('images/meteo.png'),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(context, '/meteo');
              //   },
              // ),
              // InkWell(
              //   child: Ink.image(
              //     height: 180,
              //     width: 180,
              //     image: const AssetImage('images/gallerie.png'),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(context, '/gallerie');
              //   },
              // ),
              // InkWell(
              //   child: Ink.image(
              //     height: 180,
              //     width: 180,
              //     image: const AssetImage('images/pays.png'),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(context, '/pays');
              //   },
              // ),
              // InkWell(
              //   child: Ink.image(
              //     height: 180,
              //     width: 180,
              //     image: const AssetImage('images/contact.png'),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(context, '/contact');
              //   },
              // ),
              // InkWell(
              //   child: Ink.image(
              //     height: 180,
              //     width: 180,
              //     image: const AssetImage('images/parametres.png'),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(context, '/parametres');
              //   },
              // ),
              // InkWell(
              //   child: Ink.image(
              //     height: 180,
              //     width: 180,
              //     image: const AssetImage('images/deconnexion.png'),
              //   ),
              //   onTap: () async {
              //     prefs = await SharedPreferences.getInstance();
              //     prefs.setBool("connecte", false);
              //     Navigator.pushNamedAndRemoveUntil(
              //         context, '/login', (route) => false);
              //   },
              // ),
              //méthode 2
              ...(GlobalParams.accueil as List).map((item) {
                return InkWell(
                  child: Ink.image(
                    height: 180,
                    width: 180,
                    image: AssetImage('${item['title']}'),
                  ),
                  onTap: () async {
                    if ('${item['title']}' != "images/deconnexion.png") {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "${item['route']}");
                    } else {
                      prefs = await SharedPreferences.getInstance();
                      prefs.setBool("connecte", false);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                    }
                  },
                );
              }),
            ],
          ),
          // child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         minimumSize: Size.fromHeight(50),
          //         backgroundColor: Colors.indigo[200]),
          //     onPressed: () {
          //       _onDec(context);
          //     },
          //     child: Text(
          //       'Déconnexion',
          //       style: TextStyle(fontSize: 22, color: Colors.white),
          //     ))));
        ));
  }

  Future<void> _onDec(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}
