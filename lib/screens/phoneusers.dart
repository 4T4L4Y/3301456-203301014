import 'package:filmhub/models/user.dart';
import 'package:filmhub/utils/database_handler.dart';
import 'package:flutter/material.dart';

class PhoneUsers extends StatelessWidget {
  static String routeName = "phoneusers";
  const PhoneUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kullanıcılar",
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
              child: FutureBuilder(
            future: DatabaseHandler().retrieveUsers(),
            builder: (context, AsyncSnapshot<List<HubUser>> snap) {
              if (snap.hasData) {
                return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onDoubleTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alerts(context, "çift bastın");
                          },
                        ),
                        onLongPress: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alerts(context, "uzun bastın");
                          },
                        ),
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alerts(context, "bastın");
                          },
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.3)),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                snap.data![index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                snap.data![index].email,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Text("Kullanıcı yok");
              }
            },
          ))
        ],
      ),
    );
  }
}

AlertDialog alerts(BuildContext context, String text) {
  return AlertDialog(
    title: Text(
      text,
    ),
    alignment: Alignment.center,
    actions: [
      ElevatedButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text(
          "Ok",
        ),
      ),
    ],
  );
}
