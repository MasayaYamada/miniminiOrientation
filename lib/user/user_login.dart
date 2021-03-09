import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_orientailing/user/user_home.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final gameIDTextController = TextEditingController();

  final fireStoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('ゲーム ログインページ'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Game ID',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.games),
                    hintText: 'Game ID',
                  ),
                  controller: gameIDTextController,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  child: Text(
                    "ログインする",
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.yellowAccent,
                  shape: StadiumBorder(),
                  onPressed: () {
                    try {
                      fireStoreInstance
                          .collection('gameIdCollection')
                          .doc(gameIDTextController.text)
                          .get()
                          .then((doc) {
                        if (doc.data()["email"] == null) {
                          Future showMyDialog(
                              BuildContext context, Widget dialog) {
                            return showDialog(
                                context: context,
                                builder: (BuildContext context) => dialog);
                          }
                        }
                        Navigator.push(
                          context,
                          new MaterialPageRoute<Null>(
                            settings: const RouteSettings(name: "/userHome"),
                            builder: (BuildContext context) => UserHome(
                              adminEmail: doc.data()['email'].toString(),
                              gameId: gameIDTextController.text,
                            ),
                          ),
                        );
                      });
                    } catch (error) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("ゲームIDが存在しません。もう一度確認をお願いします。"),
                      );
                    }
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
            ),
          ],
        ),
      ),
    );
  }
}
