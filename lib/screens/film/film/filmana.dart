import 'package:filmhub/screens/film/film/yabanci_film.dart';
import 'package:filmhub/screens/film/film/yerli_film.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class FilmAna extends StatefulWidget {
  static String routeName = "filmana";

  const FilmAna({Key? key}) : super(key: key);

  @override
  _FilmAnaState createState() => _FilmAnaState();
}

class _FilmAnaState extends State<FilmAna> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Filmler",
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
                          YerliFilm(),
                          YabanciFilm(),
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
