import 'package:filmhub/models/dizi.dart';
import 'package:filmhub/mycontainers/mycontainer_dizi.dart';
import 'package:filmhub/services/firestore_helper.dart';
import 'package:flutter/material.dart';

class Dark extends StatefulWidget {
  static String routeName = '/dark';
  const Dark({Key? key}) : super(key: key);

  @override
  _DarkState createState() => _DarkState();
}

class _DarkState extends State<Dark> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Dizi?>(
          future: FirestoreDiziHelper.readYabanciDizi('dark'),
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
