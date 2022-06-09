import 'package:filmhub/models/film.dart';
import 'package:filmhub/mycontainers/mycontainer_film.dart';
import 'package:filmhub/services/firestore_helper.dart';
import 'package:flutter/material.dart';

class GodFather extends StatefulWidget {
  static String routeName = '/god_father';
  const GodFather({Key? key}) : super(key: key);

  @override
  _GodFatherState createState() => _GodFatherState();
}

class _GodFatherState extends State<GodFather> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Film?>(
          future: FirestoreFilmHelper.readYabanciFilm('god_father'),
          builder: (context, AsyncSnapshot<Film?> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return MyFilmContainer(
                  context, data.film_Adi, data.film_Hakkinda, data.film_Id);
            } else {
              return Center(child: Text(snapshot.error.toString()));
            }
          },
        ),
      ),
    );
  }
}
