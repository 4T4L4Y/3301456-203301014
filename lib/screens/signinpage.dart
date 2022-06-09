import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kayıt Ol",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/image.jpg", fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.all(75.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.black.withOpacity(0.2),
                      elevation: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 75),
                              child: Text(
                                "KAYIT OL",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextField(
                              controller: nameController,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                      borderSide:
                                          BorderSide(color: Color(0xFF212121))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                      borderSide:
                                          BorderSide(color: Color(0xFF212121))),
                                  labelText: 'Kullanıcı Adı',
                                  labelStyle: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: emailController,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                      borderSide:
                                          BorderSide(color: Color(0xFF212121))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                      borderSide:
                                          BorderSide(color: Color(0xFF212121))),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: passwordController,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                      borderSide:
                                          BorderSide(color: Color(0xFF212121))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                      borderSide:
                                          BorderSide(color: Color(0xFF212121))),
                                  labelText: 'Şifre',
                                  labelStyle: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 50),
                      child: GestureDetector(
                        onTap: () async {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());

                          final user = HubUser(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());

                          await createUser(
                              user, FirebaseAuth.instance.currentUser!.uid);

                          await FirebaseAuth.instance.signOut();
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 48),
                            child: const Text(
                              "Kayıt Ol",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future createUser(HubUser user, String userId) async {
    DocumentReference docUser =
        FirebaseFirestore.instance.collection('users').doc(userId);
    user.id = docUser.id;
    final userJson = user.toJson();
    await docUser.set(userJson);
  }
}
