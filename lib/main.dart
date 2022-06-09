import 'package:filmhub/screens/dizi/yasakelma.dart';
import 'package:filmhub/screens/film/godfather.dart';
import 'package:filmhub/screens/film/organizeisler.dart';
import 'package:filmhub/screens/film/organizeisler2.dart';
import 'package:filmhub/screens/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/dizi/dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        OrganizeIsler.routeName: (context) => OrganizeIsler(),
        OrganizeIsler2.routeName: (context) => OrganizeIsler2(),
        GodFather.routeName: (context) => GodFather(),
        YasakElma.routeName: (context) => YasakElma(),
        Dark.routeName: (context) => Dark(),
      },
    );
  }
}
