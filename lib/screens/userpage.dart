import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmhub/models/user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final String userId;

  const UserPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Kullanıcı Bilgileri",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/image.jpg", fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.all(72.0),
            child: Material(
              borderRadius: BorderRadius.circular(32),
              color: Colors.black54,
              elevation: 100,
              child: FutureBuilder<HubUser?>(
                future: readKullanici(widget.userId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final user = snapshot.data!;
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black54,
                            maxRadius: 36,
                            minRadius: 36,
                            child: Icon(
                              Icons.person,
                              size: 36,
                              color: Colors.white,
                            ),
                          ),
                          Divider(
                            height: 50,
                          ),
                          Text(
                            'Kullanıcı Adı',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Divider(height: 8),
                          Text(
                            user.name,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Divider(height: 50),
                          Text(
                            'Email',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          Divider(height: 8),
                          Text(user.email,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white))
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 3,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<HubUser?> readKullanici(String userId) async {
    final docKullanici =
        FirebaseFirestore.instance.collection('users').doc(userId);

    final snapshot = await docKullanici.get();
    if (snapshot.exists) {
      return HubUser.fromJson(snapshot.data()!);
    }
    return null;
  }
}