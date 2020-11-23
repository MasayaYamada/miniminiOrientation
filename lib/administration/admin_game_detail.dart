import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_orientailing/administration/admin_add_times.dart';

class AdminGameDetails extends StatefulWidget {
  final String email;
  final String gameId;

  AdminGameDetails({this.email, this.gameId});

  @override
  _AdminGameDetailsState createState() =>
      _AdminGameDetailsState(this.email, this.gameId);
}

class _AdminGameDetailsState extends State<AdminGameDetails> {
  String email;
  String gameId;

  final fireStoreInstance = FirebaseFirestore.instance;

  _AdminGameDetailsState(this.email, this.gameId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ゲーム設定画面"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() {
              Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                  settings: const RouteSettings(name: "/adminAddItems"),
                  builder: (BuildContext context) => AdminAddItems(
                    email: email,
                    gameId: gameId,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreInstance
            .collection(email)
            .doc(gameId)
            .collection('items')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              if (document.data() == null || snapshot.hasError) {
                return Container(
                  child: Text(
                    'No Data!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              if (snapshot.data != null && !snapshot.hasError) {
                return Card(
                  margin: EdgeInsets.all(4.0),
                  child: Dismissible(
                    direction: DismissDirection.endToStart,
                    resizeDuration: Duration(milliseconds: 200),
                    key: ObjectKey(snapshot),
                    onDismissed: (direction) {
                      // TODO: implement your delete function and check direction if needed
                    },
                    background: Container(
                      padding: EdgeInsets.only(right: 28.0),
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.red,
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                    ),
                    child: ListTile(
                      leading: Image.network(document.data()["imageURL"]),
                      title: Text(document.data()["itemTitle"]),
                      subtitle: Text(document.data()["itemPoint"] + "pt"),
                    ),
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
