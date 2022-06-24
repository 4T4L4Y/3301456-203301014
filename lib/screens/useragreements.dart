import 'package:filmhub/screens/kvkk.dart';
import 'package:filmhub/screens/termsofservice.dart';
import 'package:flutter/material.dart';

class UserAgreements extends StatelessWidget {
  static String routeName = "useragreements";
  const UserAgreements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Agreements",
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
          Center(
            child: Column(
              children: [
                Divider(),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed(TermsOfService.routeName),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.3)),
                    alignment: Alignment.center,
                    child: Text(
                      "Terms Of Service",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(KVKK.routeName),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.3)),
                    alignment: Alignment.center,
                    child: Text(
                      "KVKK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
