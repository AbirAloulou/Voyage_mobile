import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo[200],
        ),
        body: Center(
          child: Wrap(
            children: [
              InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: AssetImage('images/meteo.png'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/meteo');
                },
              ),
              InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: AssetImage('images/gallerie.png'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/gallerie');
                },
              ),
              InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: AssetImage('images/pays.png'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/pays');
                },
              ),
              InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: AssetImage('images/contact.png'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
              InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: AssetImage('images/parametres.png'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/parametres');
                },
              ),
              InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: AssetImage('images/deconnexion.png'),
                ),
                onTap: () async {
                  prefs = await SharedPreferences.getInstance();
                  prefs.setBool("connecte", false);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
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
