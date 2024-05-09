import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login =
      new TextEditingController(); // hetha 3malt controle bech nejem ne5o value mte3 login
  TextEditingController txt_psw = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Authentification Page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo[200],
        ),
        body: Center(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                  controller: txt_login,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Identifiant",
                      border: UnderlineInputBorder()
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(15),
                      //   borderSide: BorderSide(width: 1),
                      // )),
                      )),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                obscureText: true,
                controller: txt_psw,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    hintText: "Mot de Passe",
                    border: UnderlineInputBorder()
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(15),
                    //     borderSide: BorderSide(width: 1))
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      backgroundColor: Colors.indigo[200]),
                  onPressed: () {
                    _onlog(context);
                  },
                  child: Text(
                    'Connexion',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  )),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/inscription');
                },
                child: Text(
                  "Créer un compte",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.indigo[600],
                    decoration: TextDecoration.underline,
                  ),
                ))
          ],
        )));
  }

  Future<void> _onlog(BuildContext context) async {
    // prefs = await SharedPreferences.getInstance();
    // var log = prefs.getString("login");
    // var psw = prefs.getString(
    //     "psw"); // zedneha async ... await bech n9olo requete tebta chwaya estaneha w raja3li type de future
    // if (txt_login.text == log && txt_psw.text == psw) {
    //   prefs.setBool("connecte", true);
    //   Navigator.pop(context);
    //   Navigator.pushNamed(context, '/home');
    // } else {
    //   const snackBar = SnackBar(
    //       content: Text('vérifier votre identifiant et mot de passe!'));
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // }
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: txt_login.text, password: txt_psw.text);
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        const snackBar =
            SnackBar(content: Text('No user found for that email.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        const snackBar =
            SnackBar(content: Text('Wrong password provided for that user.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
