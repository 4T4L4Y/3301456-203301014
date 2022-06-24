import 'package:filmhub/screens/loginpage.dart';
import 'package:filmhub/screens/selectionscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "splashpage";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double photoSizex = 0;
  double photoSizey = 0;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        photoSizex += MediaQuery.of(context).size.width;
        photoSizey += MediaQuery.of(context).size.height / 2;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      (FirebaseAuth.instance.currentUser == null)
          ? Navigator.of(context).popAndPushNamed(LoginPage.routeName)
          : {
              Navigator.of(context).pop(),
              Navigator.of(context).pushNamed(SelectionScreen.routeName),
            };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.bounceOut,
              width: photoSizex,
              height: photoSizey,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/splash.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Text(
                  "Film HUB",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
