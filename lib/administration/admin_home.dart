import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AdminHome extends StatefulWidget {
  final FirebaseUser userData;

  AdminHome({Key key, this.userData}) : super(key: key);

  @override
  _AdminHOmeState createState() => _AdminHOmeState(userData);
}

class _AdminHOmeState extends State<AdminHome> {
  FirebaseUser userData;
  String name = "";
  String email;
  String photoUrl;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  _AdminHOmeState(FirebaseUser userData) {
    this.userData = userData;
    this.name = userData.displayName;
    this.email = userData.email;
    this.photoUrl = userData.photoUrl;
  }

  Future<void> _handleSignOut() async {
    await FirebaseAuth.instance.signOut();
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ユーザー情報表示"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(this.photoUrl),
              Text(
                this.name,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                this.email,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              RaisedButton(
                child: Text('Sign Out Google'),
                onPressed: () {
                  _handleSignOut().catchError((e) => print(e));
                },
              ),
            ]),
      ),
    );
  }
}
