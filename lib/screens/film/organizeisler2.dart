import 'package:filmhub/models/film.dart';
import 'package:filmhub/mycontainers/mycontainer_film.dart';
import 'package:filmhub/services/firestore_helper.dart';
import 'package:flutter/material.dart';

class OrganizeIsler2 extends StatefulWidget {
  static String routeName = '/organize_isler_2';
  const OrganizeIsler2({Key? key}) : super(key: key);

  @override
  _OrganizeIsler2State createState() => _OrganizeIsler2State();
}

class _OrganizeIsler2State extends State<OrganizeIsler2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Film?>(
          future: FirestoreFilmHelper.readYerliFilm('organize_isler_2'),
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
