import 'package:filmhub/screens/dizi/yabanci_dizi.dart';
import 'package:filmhub/screens/dizi/yerli_dizi.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class DiziAna extends StatefulWidget {
  const DiziAna({Key? key}) : super(key: key);

  @override
  _DiziAnaState createState() => _DiziAnaState();
}

class _DiziAnaState extends State<DiziAna> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Diziler",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:
                    Image.asset("assets/images/image.jpg", fit: BoxFit.fill)),
            DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                    child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Color(0xFF212121),
                        indicator: RectangularIndicator(
                          color: Colors.white54,
                          bottomLeftRadius: 100,
                          bottomRightRadius: 100,
                          topLeftRadius: 100,
                          topRightRadius: 100,
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              'Yerli',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Yabancı',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overScroll) {
                        overScroll.disallowIndicator();
                        return true;
                      },
                      child: TabBarView(
                        children: [
                          YerliDizi(),
                          YabanciDizi(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
