import 'package:filmhub/mycontainers/mycontainer_film.dart';
import 'package:flutter/material.dart';

class GodFather extends StatefulWidget {
  const GodFather({Key? key}) : super(key: key);

  @override
  _GodFatherState createState() => _GodFatherState();
}

class _GodFatherState extends State<GodFather> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MyFilmContainer(context, "God Father", "dsadada", "godfather"),
      ),
    );
  }
}
