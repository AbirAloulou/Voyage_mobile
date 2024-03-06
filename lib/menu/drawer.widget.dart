import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.white, Colors.indigo])),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/profil.jpeg"),
                radius: 80,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Acceuil',
              style: TextStyle(fontSize: 22),
            ),
            leading: Icon(
              Icons.home_filled,
              color: Colors.indigo,
            ),
            trailing: Icon(
              Icons.arrow_right_rounded,
              color: Colors.indigo,
              size: 50,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text(
              'Météo',
              style: TextStyle(fontSize: 22),
            ),
            leading: Icon(
              Icons.sunny_snowing,
              color: Colors.indigo,
            ),
            trailing: Icon(
              Icons.arrow_right_rounded,
              color: Colors.indigo,
              size: 50,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/meteo');
            },
          ),
          ListTile(
            title: Text(
              'Gallerie',
              style: TextStyle(fontSize: 22),
            ),
            leading: Icon(
              Icons.image_rounded,
              color: Colors.indigo,
            ),
            trailing: Icon(
              Icons.arrow_right_rounded,
              color: Colors.indigo,
              size: 50,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/gallerie');
            },
          ),
          ListTile(
            title: Text(
              'Pays',
              style: TextStyle(fontSize: 22),
            ),
            leading: Icon(
              Icons.maps_home_work_rounded,
              color: Colors.indigo,
            ),
            trailing: Icon(
              Icons.arrow_right_rounded,
              color: Colors.indigo,
              size: 50,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/pays');
            },
          ),
          ListTile(
            title: Text(
              'Contact',
              style: TextStyle(fontSize: 22),
            ),
            leading: Icon(
              Icons.contact_page_rounded,
              color: Colors.indigo,
            ),
            trailing: Icon(
              Icons.arrow_right_rounded,
              color: Colors.indigo,
              size: 50,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
          ListTile(
            title: Text(
              'Paramètres',
              style: TextStyle(fontSize: 22),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.indigo,
            ),
            trailing: Icon(
              Icons.arrow_right_rounded,
              color: Colors.indigo,
              size: 50,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/parametres');
            },
          ),
          ListTile(
            title: Text(
              'Déconnexion',
              style: TextStyle(fontSize: 22),
            ),
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.indigo,
            ),
            trailing: Icon(
              Icons.arrow_right_rounded,
              color: Colors.indigo,
              size: 50,
            ),
            onTap: () async {
              prefs = await SharedPreferences.getInstance();
              prefs.setBool("connecte", false);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          ),
          Divider(
            height: 4,
            color: Colors.indigo,
          )
        ],
      ),
    );
  }
}
