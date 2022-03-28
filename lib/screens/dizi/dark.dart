import 'package:filmhub/mycontainers/mycontainer_dizi.dart';
import 'package:flutter/material.dart';

class Dark extends StatefulWidget {
  const Dark({Key? key}) : super(key: key);

  @override
  _DarkState createState() => _DarkState();
}

class _DarkState extends State<Dark> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MyDiziContainer(context, "Dark", "dsadada", "dark"),
      ),
    );
  }
}
