import 'package:filmhub/screens/dizi/yasakelma.dart';
import 'package:flutter/material.dart';

class YerliDizi extends StatefulWidget {
  const YerliDizi({Key? key}) : super(key: key);

  @override
  _YerliDiziState createState() => _YerliDiziState();
}

class _YerliDiziState extends State<YerliDizi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YasakElma(),
                  ),
                );
              },
              leading: Image.asset(
                "assets/images/yasakelma.jpg",
                fit: BoxFit.fill,
              ),
              title: Text("Yasak Elma"),
              subtitle: Text("Romantik/Drama"),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
