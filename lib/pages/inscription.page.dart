import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login =
      new TextEditingController(); // hetha 3malt controle bech nejem ne5o value mte3 login
  TextEditingController txt_psw = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Inscription Page',
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
                    //     borderRadius: BorderRadius.circular(15),
                    //     borderSide: BorderSide(width: 1)
                    //     ),
                    ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  obscureText:
                      true, // hethi bech t7ot ktiba mte3 mot de passe mascer
                  controller: txt_psw,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Mot de Passe",
                      border: UnderlineInputBorder()
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(15),
                      //     borderSide: BorderSide(width: 1))),
                      ),
                )),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.indigo[200]),
                onPressed: () {
                  _onInscrire(
                      context); // aya haja tebdeha bi _ fi flutter ma3neha méthode de type private
                },
                child: Text(
                  'Inscription',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "J'ai déja un compte",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.indigo[600],
                    decoration: TextDecoration.underline,
                  ),
                ))
          ],
        )));
  }

  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences
        .getInstance(); // zedneha async ... await bech n9olo requete tebta chwaya estaneha w raja3li type de future
    if (!txt_login.text.isEmpty && !txt_psw.text.isEmpty) {
      prefs.setString("login", txt_login.text);
      prefs.setString("psw", txt_psw.text);
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      const snackBar =
          SnackBar(content: Text('Vous devez remplir les champs!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
