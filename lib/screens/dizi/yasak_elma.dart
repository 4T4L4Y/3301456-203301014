import 'package:filmhub/models/dizi.dart';
import 'package:filmhub/mycontainers/mycontainer_dizi.dart';
import 'package:filmhub/services/firestore_helper.dart';
import 'package:flutter/material.dart';

class YasakElma extends StatefulWidget {
  static String routeName = '/yasak_elma';
  const YasakElma({Key? key}) : super(key: key);

  @override
  _YasakElmaState createState() => _YasakElmaState();
}

class _YasakElmaState extends State<YasakElma> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Dizi?>(
          future: FirestoreDiziHelper.readYerliDizi('yasak_elma'),
          builder: (context, AsyncSnapshot<Dizi?> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return MyDiziContainer(
                  context, data.dizi_Adi, data.dizi_Hakkinda, data.dizi_Id);
            } else {
              return Center(child: Text(snapshot.error.toString()));
            }
          },
        ),
      ),
    );
  }
}
