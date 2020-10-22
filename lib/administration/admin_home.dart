import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  final String email;

  AdminHome({@required this.email});

  @override
  State<StatefulWidget> createState() {
    return _AdminHomeState(this.email);
  }

// @override
// _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final fireStoreInstance = FirebaseFirestore.instance;
  String email;

  _AdminHomeState(this.email);

  // var testEmail = 'test01@gmail.com';

  @override
  Widget build(BuildContext context) {
    print("This email is $email");
    return Scaffold(
      appBar: AppBar(
        title: Text("管理者ホーム画面"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreInstance.collection(email).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              if (snapshot.data != null) {
                return Card(
                  child: ListTile(
                    title: Text(document.data()["gameName"]),
                    onTap: () {
                      print("tapped");
                    },
                  ),
                );
              }
            }).toList(),
          );
        },
      ),
    );
  }
}
