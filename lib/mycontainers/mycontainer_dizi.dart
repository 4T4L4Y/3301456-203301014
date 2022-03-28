import 'dart:ui';

import 'package:flutter/material.dart';

Widget MyDiziContainer(
  BuildContext context,
  String diziadi,
  String diziaciklamasi,
  String dizifoto,
) =>
    Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Text(
            "Seçim Ekranı",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
      ),
      SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/images/background.jpg", fit: BoxFit.fill)),
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 6,
                child: Container(
                  height: 150,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/$dizifoto.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Text(diziadi,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black)),
            Text(
              "Dizi Hakkında",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              diziaciklamasi,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ]);
