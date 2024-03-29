import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
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
          //method 1
          // ListTile(
          //   title: const Text(
          //     'Acceuil',
          //     style: TextStyle(fontSize: 22),
          //   ),
          //   leading: const Icon(
          //     Icons.home_filled,
          //     color: Colors.indigo,
          //   ),
          //   trailing: const Icon(
          //     Icons.arrow_right_rounded,
          //     color: Colors.indigo,
          //     size: 50,
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, '/home');
          //   },
          // ),
          // ListTile(
          //   title: const Text(
          //     'Météo',
          //     style: TextStyle(fontSize: 22),
          //   ),
          //   leading: const Icon(
          //     Icons.sunny_snowing,
          //     color: Colors.indigo,
          //   ),
          //   trailing: const Icon(
          //     Icons.arrow_right_rounded,
          //     color: Colors.indigo,
          //     size: 50,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/meteo');
          //   },
          // ),
          // ListTile(
          //   title: const Text(
          //     'Gallerie',
          //     style: TextStyle(fontSize: 22),
          //   ),
          //   leading: const Icon(
          //     Icons.image_rounded,
          //     color: Colors.indigo,
          //   ),
          //   trailing: const Icon(
          //     Icons.arrow_right_rounded,
          //     color: Colors.indigo,
          //     size: 50,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/gallerie');
          //   },
          // ),
          // ListTile(
          //   title: const Text(
          //     'Pays',
          //     style: TextStyle(fontSize: 22),
          //   ),
          //   leading: const Icon(
          //     Icons.maps_home_work_rounded,
          //     color: Colors.indigo,
          //   ),
          //   trailing: const Icon(
          //     Icons.arrow_right_rounded,
          //     color: Colors.indigo,
          //     size: 50,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/pays');
          //   },
          // ),
          // ListTile(
          //   title: const Text(
          //     'Contact',
          //     style: TextStyle(fontSize: 22),
          //   ),
          //   leading: const Icon(
          //     Icons.contact_page_rounded,
          //     color: Colors.indigo,
          //   ),
          //   trailing: const Icon(
          //     Icons.arrow_right_rounded,
          //     color: Colors.indigo,
          //     size: 50,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/contact');
          //   },
          // ),
          // ListTile(
          //   title: const Text(
          //     'Paramètres',
          //     style: TextStyle(fontSize: 22),
          //   ),
          //   leading: const Icon(
          //     Icons.settings,
          //     color: Colors.indigo,
          //   ),
          //   trailing: const Icon(
          //     Icons.arrow_right_rounded,
          //     color: Colors.indigo,
          //     size: 50,
          //   ),
          //   onTap: () {
          //     Navigator.pushNamed(context, '/parametres');
          //   },
          // ),
          // ListTile(
          //   title: const Text(
          //     'Déconnexion',
          //     style: TextStyle(fontSize: 22),
          //   ),
          //   leading: const Icon(
          //     Icons.logout_outlined,
          //     color: Colors.indigo,
          //   ),
          //   trailing: const Icon(
          //     Icons.arrow_right_rounded,
          //     color: Colors.indigo,
          //     size: 50,
          //   ),
          //   onTap: () async {
          //     prefs = await SharedPreferences.getInstance();
          //     prefs.setBool("connecte", false);
          //     Navigator.pushNamedAndRemoveUntil(
          //         context, '/login', (route) => false);
          //   },
          // ),
          // const Divider(
          //   height: 4,
          //   color: Colors.indigo,
          // )
          //method 2
          //1. configure the global.params.dart file
          //2.
          ...(GlobalParams.menus as List).map(
            (item) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${item['title']}',
                      style: TextStyle(fontSize: 22),
                    ),
                    leading: item['icon'],
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Colors.blueGrey,
                    ),
                    onTap: () async {
                      if ('${item['title']}' != "Déconnexion") {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "${item['route']}");
                      } else {
                        prefs = await SharedPreferences.getInstance();
                        prefs.setBool("connecte", false);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      }
                    },
                  ),
                  Divider(height: 4, color: Colors.blueGrey),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
