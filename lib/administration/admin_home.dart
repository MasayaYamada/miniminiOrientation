import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_orientailing/administration/admin_add_games.dart';

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
        title: Text("管理者ホーム"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() {
              Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                  settings: const RouteSettings(name: "/adminAddGames"),
                  builder: (BuildContext context) =>
                      AdminAddGames(email: email),
                ),
              );
            }),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreInstance.collection(email).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              if (snapshot.data != null && !snapshot.hasError) {
                return Card(
                  margin: EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("ゲーム名: ${document.data()["gameName"]}  "),
                          Text("ID：${document.data()["gameId"]}"),
                        ]),
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
