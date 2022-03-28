import 'package:filmhub/mycontainers/mycontainer_film.dart';
import 'package:flutter/material.dart';

class OrganizeIsler extends StatefulWidget {
  const OrganizeIsler({Key? key}) : super(key: key);

  @override
  _OrganizeIslerState createState() => _OrganizeIslerState();
}

class _OrganizeIslerState extends State<OrganizeIsler> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MyFilmContainer(
            context, "Organize İşler", "dsadada", "organizeisler"),
      ),
    );
  }
}
