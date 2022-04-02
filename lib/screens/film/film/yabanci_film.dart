import 'package:flutter/material.dart';

import '../dirilis.dart';
import '../godfather.dart';

class YabanciFilm extends StatefulWidget {
  const YabanciFilm({Key? key}) : super(key: key);

  @override
  _YabanciFilmState createState() => _YabanciFilmState();
}

class _YabanciFilmState extends State<YabanciFilm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dirilis()));
              },
              leading: Image.asset(
                "assets/images/dirilis.jpg",
                fit: BoxFit.fill,
              ),
              title: Text("Diriliş"),
              subtitle: Text("Western/Macera"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GodFather()));
              },
              leading: Image.asset(
                "assets/images/godfather.jpg",
                fit: BoxFit.fill,
              ),
              title: Text("God Father"),
              subtitle: Text("Suç/Dram"),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
