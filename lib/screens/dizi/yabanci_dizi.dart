import 'package:filmhub/screens/dizi/dark.dart';
import 'package:filmhub/screens/dizi/lacasadepapel.dart';
import 'package:flutter/material.dart';

class YabanciDizi extends StatefulWidget {
  const YabanciDizi({Key? key}) : super(key: key);

  @override
  _YabanciDiziState createState() => _YabanciDiziState();
}

class _YabanciDiziState extends State<YabanciDizi> {
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
                    builder: (context) => Dark(),
                  ),
                );
              },
              leading: Image.asset(
                "assets/images/dark.jpg",
                fit: BoxFit.fill,
              ),
              title: Text("Dark"),
              subtitle: Text("Gizem"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LaCasaDePapel(),
                  ),
                );
              },
              leading: Image.asset(
                "assets/images/lacasadepapel.jpg",
                fit: BoxFit.fill,
              ),
              title: Text("La Casa De Papel"),
              subtitle: Text("Suç"),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
