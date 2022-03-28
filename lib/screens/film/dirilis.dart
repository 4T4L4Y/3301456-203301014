import 'package:filmhub/mycontainers/mycontainer_film.dart';
import 'package:flutter/material.dart';

class Dirilis extends StatefulWidget {
  const Dirilis({Key? key}) : super(key: key);

  @override
  _DirilisState createState() => _DirilisState();
}

class _DirilisState extends State<Dirilis> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MyFilmContainer(context, "Diriliş", "dsadada", "dirilis"),
      ),
    );
  }
}
