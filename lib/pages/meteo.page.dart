import 'package:flutter/material.dart';

import 'meteo-details.page.dart';

class MeteoPage extends StatelessWidget {
  TextEditingController txt_ville = new TextEditingController();

  MeteoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meteo Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 199, 207, 254),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_ville,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.apartment),
                  hintText: "ville",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.indigo[200]),
                onPressed: () {
                  _onGetMeteoDetails(context, txt_ville.text);
                },
                child: Text(
                  'chercher',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }

  void _onGetMeteoDetails(BuildContext context, String ville) {
    String v = txt_ville.text;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MeteoDetailsPage(v)));
    txt_ville.text = "";
  }
}
