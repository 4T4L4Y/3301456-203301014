import 'package:filmhub/mycontainers/mycontainer_dizi.dart';
import 'package:flutter/material.dart';

class LaCasaDePapel extends StatefulWidget {
  const LaCasaDePapel({Key? key}) : super(key: key);

  @override
  _LaCasaDePapelState createState() => _LaCasaDePapelState();
}

class _LaCasaDePapelState extends State<LaCasaDePapel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MyDiziContainer(
            context, "La Casa De Papel", "dsadada", "lacasadepapel"),
      ),
    );
  }
}
