import 'package:filmhub/screens/changepassword.dart';
import 'package:filmhub/screens/commits.dart';
import 'package:filmhub/screens/dizi/diziana.dart';
import 'package:filmhub/screens/dizi/yabanci_dizi.dart';
import 'package:filmhub/screens/dizi/yasakelma.dart';
import 'package:filmhub/screens/dizi/yerli_dizi.dart';
import 'package:filmhub/screens/film/dirilis.dart';
import 'package:filmhub/screens/film/film/yabanci_film.dart';
import 'package:filmhub/screens/film/film/yerli_film.dart';
import 'package:filmhub/screens/film/godfather.dart';
import 'package:filmhub/screens/film/organizeisler.dart';
import 'package:filmhub/screens/film/organizeisler2.dart';
import 'package:filmhub/screens/kvkk.dart';
import 'package:filmhub/screens/loginpage.dart';
import 'package:filmhub/screens/phoneusers.dart';
import 'package:filmhub/screens/savedfilms.dart';
import 'package:filmhub/screens/selectionscreen.dart';
import 'package:filmhub/screens/signinpage.dart';
import 'package:filmhub/screens/splashpage.dart';
import 'package:filmhub/screens/termsofservice.dart';
import 'package:filmhub/screens/toplist.dart';
import 'package:filmhub/screens/useragreements.dart';
import 'package:filmhub/screens/userpage.dart';
import 'package:filmhub/utils/database_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    () => {DatabaseHandler().initializeDB()};
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        YabanciDizi.routeName: (context) => YabanciDizi(),
        YabanciFilm.routeName: (context) => YabanciFilm(),
        YasakElma.routeName: (context) => YasakElma(),
        YerliDizi.routeName: (context) => YerliDizi(),
        YerliFilm.routeName: (context) => YerliFilm(),
        Dirilis.routeName: (context) => Dirilis(),
        GodFather.routeName: (context) => GodFather(),
        ChangePassword.routeName: (context) => ChangePassword(),
        Commits.routeName: (context) => Commits(),
        KVKK.routeName: (context) => KVKK(),
        LoginPage.routeName: (context) => LoginPage(),
        PhoneUsers.routeName: (context) => PhoneUsers(),
        SavedFilms.routeName: (context) => SavedFilms(),
        SignInPage.routeName: (context) => SignInPage(),
        SplashPage.routeName: (context) => SplashPage(),
        TermsOfService.routeName: (context) => TermsOfService(),
        TopList.routeName: (context) => TopList(),
        UserAgreements.routeName: (context) => UserAgreements(),
        DiziAna.routeName: (context) => DiziAna(),
        OrganizeIsler.routeName: (context) => OrganizeIsler(),
        OrganizeIsler2.routeName: (context) => OrganizeIsler2(),
        Dark.routeName: (context) => Dark(),
        UserPage.routeName: (context) =>
            UserPage(userId: FirebaseAuth.instance.currentUser!.uid),
        SelectionScreen.routeName: (context) =>
            SelectionScreen(userId: FirebaseAuth.instance.currentUser!.uid),
      },
    );
  }
}
