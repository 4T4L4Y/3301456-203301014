import 'package:filmhub/mycontainers/mycontainer_film.dart';
import 'package:flutter/material.dart';

class OrganizeIsler2 extends StatefulWidget {
  const OrganizeIsler2({Key? key}) : super(key: key);

  @override
  _OrganizeIsler2State createState() => _OrganizeIsler2State();
}

class _OrganizeIsler2State extends State<OrganizeIsler2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MyFilmContainer(
            context, "Organize İşler 2", "dsadada", "organizeisler2"),
      ),
    );
  }
}
