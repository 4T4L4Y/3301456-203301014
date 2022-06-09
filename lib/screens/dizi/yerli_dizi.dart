import 'package:filmhub/models/dizi.dart';
import 'package:filmhub/services/firestore_helper.dart';
import 'package:flutter/material.dart';

class YerliDizi extends StatefulWidget {
  const YerliDizi({Key? key}) : super(key: key);

  @override
  _YerliDiziState createState() => _YerliDiziState();
}

class _YerliDiziState extends State<YerliDizi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<List<Dizi>>(
        stream: FirestoreDiziHelper.readYerliDiziler(),
        builder: (context, AsyncSnapshot<List<Dizi>> snapshot) {
          getGameList(AsyncSnapshot<List<Dizi?>> snapshot) {
            return snapshot.data!
                .map(
                  (dizi) => ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/${dizi!.dizi_Id}');
                    },
                    leading: Image.asset(
                      "assets/images/${dizi!.dizi_Id}.jpg",
                      fit: BoxFit.fill,
                    ),
                    title: Text(dizi.dizi_Adi),
                    subtitle: Text(dizi.dizi_Turu),
                  ),
                )
                .toList();
          }

          if (snapshot.hasData) {
            return Column(
              children: getGameList(snapshot),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 3,
              ),
            );
          }
        },
      ),
    );
  }
}
