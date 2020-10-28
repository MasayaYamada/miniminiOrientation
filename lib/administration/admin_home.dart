import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  final String email;

  AdminHome({@required this.email});

  @override
  State<StatefulWidget> createState() {
    return _AdminHomeState(this.email);
  }
}

class _AdminHomeState extends State<AdminHome> {
  final fireStoreInstance = FirebaseFirestore.instance;
  String email;

  _AdminHomeState(this.email);

  @override
  Widget build(BuildContext context) {
    print("This email is $email");
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home Window"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreInstance.collection(email).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              if (snapshot.data != null && !snapshot.hasError) {
                return Card(
                  child: ListTile(
                    title: Text(document.data()["gameName"]),
                    onTap: () {
                      print("tapped");
                      Navigator.pushNamed(context, '/adminGameDetail');
                    },
                  ),
                );
              } else if (document == null) {
                return Center(child: Text('No data'));
              } else {
                return Center(
                  child: Text('Woooops'),
                );
              }
            }).toList(),
          );
        },
      ),
    );
  }
}
