import 'package:flutter/material.dart';

import '../organizeisler.dart';
import '../organizeisler2.dart';

class YerliFilm extends StatefulWidget {
  const YerliFilm({Key? key}) : super(key: key);

  @override
  _YerliFilmState createState() => _YerliFilmState();
}

class _YerliFilmState extends State<YerliFilm> {
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
                    builder: (context) => OrganizeIsler(),
                  ),
                );
              },
              leading: Image.asset(
                "assets/images/organizeisler.jpg",
                fit: BoxFit.fill,
              ),
              title: Text("Organize İşler"),
              subtitle: Text("Komedi/Drama"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrganizeIsler2(),
                  ),
                );
              },
              leading: Image.asset(
                "assets/images/organizeisler2.jpg",
                fit: BoxFit.fill,
              ),
              title: Text("Organize İşler 2"),
              subtitle: Text("Komedi/Aksiyon"),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
