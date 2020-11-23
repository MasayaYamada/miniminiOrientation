import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final gameIDTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                    //TODO: implement for move to user game controller
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
