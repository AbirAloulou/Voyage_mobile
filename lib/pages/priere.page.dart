import 'package:flutter/material.dart';
import 'package:voyage/pages/Priere-details.page.dart';

class PrierePage extends StatelessWidget {
  PrierePage({super.key});

  TextEditingController txt_ville = new TextEditingController();
  TextEditingController txt_pays = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prière Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 199, 207, 254),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_pays,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.pin_drop_sharp),
                  hintText: "pays",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1))),
            ),
          ),
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
                  _onGetMeteoDetails(context, txt_ville.text, txt_pays.text);
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

  void _onGetMeteoDetails(BuildContext context, String ville, String pays) {
    String v = txt_ville.text;
    String p = txt_pays.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PriereDetailsPage(v, p)));
    txt_ville.text = "";
    txt_pays.text = "";
  }
}
