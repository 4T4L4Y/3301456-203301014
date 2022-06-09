import 'package:filmhub/models/film.dart';
import 'package:filmhub/services/firestore_helper.dart';
import 'package:flutter/material.dart';

class YerliFilm extends StatefulWidget {
  const YerliFilm({Key? key}) : super(key: key);

  @override
  _YerliFilmState createState() => _YerliFilmState();
}

class _YerliFilmState extends State<YerliFilm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<Film>>(
        stream: FirestoreFilmHelper.readYerliFilms(),
        builder: (context, AsyncSnapshot<List<Film>> snapshot) {
          getGameList(AsyncSnapshot<List<Film?>> snapshot) {
            return snapshot.data!
                .map(
                  (film) => ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/${film!.film_Id}');
                    },
                    leading: Image.asset(
                      "assets/images/${film!.film_Id}.jpg",
                      fit: BoxFit.fill,
                    ),
                    title: Text(film.film_Adi),
                    subtitle: Text(film.film_Turu),
                  ),
                )
                .toList();
          }

          if (snapshot.hasData) {
            return Column(
              children: getGameList(snapshot),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 3,
              ),
            );
          }
        },
      ),
    );
  }
}
