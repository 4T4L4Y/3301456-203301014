import 'package:filmhub/screens/utils.dart';
import 'package:flutter/material.dart';

class SavedFilms extends StatefulWidget {
  static String routeName = "savedfilms";
  const SavedFilms({Key? key}) : super(key: key);

  @override
  State<SavedFilms> createState() => _SavedFilmsState();
}

class _SavedFilmsState extends State<SavedFilms> {
  final controller = TextEditingController();
  String tempText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İzlenecekler",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/image.jpg", fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.all(72.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: Color(0xFF212121))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(color: Color(0xFF212121))),
                        labelText: 'Film veya dizi adı',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black54)),
                    onPressed: () {
                      Utils.dosyayiKaydet(controller.text.trim());
                    },
                    child: Text('Kaydet'),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black54)),
                      onPressed: () {
                        Utils.dosyayiOku().then(
                          (value) {
                            setState(
                              () {
                                tempText = value;
                              },
                            );
                          },
                        );
                      },
                      child: Text('Kaydedilenleri göster')),
                  Divider(),
                  Container(
                    color: Colors.white70,
                    padding: EdgeInsets.all(12),
                    child: Text(tempText),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
