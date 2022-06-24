import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmhub/models/user.dart';
import 'package:filmhub/screens/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Globals.dart' as global;

class ChangePassword extends StatelessWidget {
  static String routeName = "changepassword";
  ChangePassword({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController1 = TextEditingController();
  final newPasswordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Change Password",
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
                              Divider(),
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
                              Divider(),
                              TextField(
                                controller: oldPasswordController,
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
                                    labelText: 'Eski Şifre',
                                    labelStyle: TextStyle(color: Colors.white)),
                              ),
                              Divider(),
                              TextField(
                                controller: newPasswordController1,
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
                                    labelText: 'Yeni Şifre',
                                    labelStyle: TextStyle(color: Colors.white)),
                              ),
                              Divider(),
                              TextField(
                                controller: newPasswordController2,
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
                                    labelText: 'Yeni Şifre (tekrar girin)',
                                    labelStyle: TextStyle(color: Colors.white)),
                              ),
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
                                final user = HubUser(
                                    name: global.user!.name,
                                    email: global.user!.email,
                                    password:
                                        newPasswordController1.text.trim());
                                if (newPasswordController1.text ==
                                    newPasswordController2.text) {
                                  await FirebaseAuth.instance.currentUser
                                      ?.reauthenticateWithCredential(
                                          EmailAuthProvider.credential(
                                              email: emailController.text,
                                              password:
                                                  oldPasswordController.text))
                                      .then(
                                        (value) => FirebaseAuth
                                            .instance.currentUser
                                            ?.updatePassword(
                                                newPasswordController1.text)
                                            .then(
                                          (value) {
                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(FirebaseAuth
                                                    .instance.currentUser?.uid)
                                                .update(user.toJson());

                                            FirebaseAuth.instance.signOut();
                                            Navigator.of(context).popUntil(
                                                (route) =>
                                                    route ==
                                                    MaterialPageRoute(
                                                        builder: (builder) =>
                                                            LoginPage()));
                                          },
                                        ),
                                      );
                                }
                              },
                              child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(12)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Değiştir",
                                    style: TextStyle(color: Colors.white),
                                  )),
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
