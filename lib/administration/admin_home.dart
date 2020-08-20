import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  // Firebase google auth user info
//  FirebaseUser userData;
//  String name = "";
//  String email;
//  String photoUrl;
//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//  _AdminHOmeState(FirebaseUser userData) {
//    this.userData = userData;
//    this.name = userData.displayName;
//    this.email = userData.email;
//    this.photoUrl = userData.photoUrl;
//  }

//  Future<void> _handleSignOut() async {
//    await FirebaseAuth.instance.signOut();
//    try {
//      await _googleSignIn.signOut();
//    } catch (e) {
//      print(e);
//    }
//    Navigator.pop(context);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("管理者ホーム画面"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Game Selected'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/adminGameDetail');
                },
              ),
            ]),
      ),
    );
  }
}
