import 'dart:ui';

import 'package:filmhub/screens/userpage.dart';
import 'package:flutter/material.dart';

import 'dizi/diziana.dart';
import 'film/film/filmana.dart';

class SelectionScreen extends StatefulWidget {
  final String userId;
  const SelectionScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Film HUB",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/image.jpg", fit: BoxFit.fill)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 75, vertical: 100),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserPage(
                                          userId: widget.userId,
                                        )));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            maxRadius: 36,
                            minRadius: 36,
                            child: Icon(
                              Icons.person,
                              size: 36,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Divider(),
                        Text(
                          'Kullanıcı Paneli',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 100,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.black54,
                    elevation: 100,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FilmAna()));
                            },
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(16)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 48),
                                child: Text(
                                  "Filmler",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiziAna()));
                            },
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 48),
                                child: Text(
                                  "Diziler",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
