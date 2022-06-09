import 'package:filmhub/models/film.dart';
import 'package:filmhub/mycontainers/mycontainer_film.dart';
import 'package:filmhub/services/firestore_helper.dart';
import 'package:flutter/material.dart';

class OrganizeIsler extends StatefulWidget {
  static String routeName = '/organize_isler';

  const OrganizeIsler({Key? key}) : super(key: key);

  @override
  _OrganizeIslerState createState() => _OrganizeIslerState();
}

class _OrganizeIslerState extends State<OrganizeIsler> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Film?>(
          future: FirestoreFilmHelper.readYerliFilm('organize_isler'),
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
