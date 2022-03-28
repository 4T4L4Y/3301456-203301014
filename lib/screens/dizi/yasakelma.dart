import 'package:filmhub/mycontainers/mycontainer_dizi.dart';
import 'package:flutter/material.dart';

class YasakElma extends StatefulWidget {
  const YasakElma({Key? key}) : super(key: key);

  @override
  _YasakElmaState createState() => _YasakElmaState();
}

class _YasakElmaState extends State<YasakElma> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MyDiziContainer(context, "Yasak Elma", "dsadada", "yasakelma"),
      ),
    );
  }
}
