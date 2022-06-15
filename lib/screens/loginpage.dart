import 'package:filmhub/screens/signinpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'selectionscreen.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/loginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Giriş",
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
            Center(
                child:
                    Image.asset("assets/images/filmhub.png", fit: BoxFit.fill)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 75.0, vertical: 60),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.black.withOpacity(0.5),
                        elevation: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 75),
                                child: Text(
                                  "GİRİŞ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextField(
                                controller: emailController,
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        borderSide: BorderSide(
                                            color: Color(0xFF212121))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        borderSide: BorderSide(
                                            color: Color(0xFF212121))),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: passwordController,
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        borderSide: BorderSide(
                                            color: Color(0xFF212121))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        borderSide: BorderSide(
                                            color: Color(0xFF212121))),
                                    labelText: 'Şifre',
                                    labelStyle: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 50),
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim());
                                } catch (r) {
                                  setState(() {
                                    SnackBar snackbar() => SnackBar(
                                        content: Center(
                                            heightFactor: 1,
                                            child: Text(
                                                'Email veya parola hatalı.')));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar());
                                  });
                                }

                                if (FirebaseAuth.instance.currentUser != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectionScreen(
                                        userId: FirebaseAuth
                                            .instance.currentUser!.uid,
                                      ),
                                    ),
                                  );

                                  SnackBar snackbar() => SnackBar(
                                      content: Center(
                                          heightFactor: 1,
                                          child: Text('Giriş yapıldı.')));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar());
                                }
                              },
                              child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(12)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 48),
                                  child: Text(
                                    "Giriş Yap",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 50),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 48),
                                child: Text(
                                  "Kayıt Ol",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
