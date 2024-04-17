import 'package:flutter/material.dart';
import 'package:voyage/pages/gallerie-details.page.dart';

class GalleriePage extends StatelessWidget {
  TextEditingController txt_keyword = new TextEditingController();

  GalleriePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallerie Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[200],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_keyword,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.image_search),
                  hintText: "Keyword",
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
                  _onGetGalleryDetails(context, txt_keyword.text);
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

  void _onGetGalleryDetails(BuildContext context, String keyword) {
    String k = txt_keyword.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => GallerieDetailsPage(k)));
    txt_keyword.text = "";
  }
}
