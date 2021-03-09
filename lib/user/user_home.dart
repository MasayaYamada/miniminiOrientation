import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  final String adminEmail;
  final String gameId;

  UserHome({@required this.adminEmail, @required this.gameId});

  @override
  _UserHomeState createState() => _UserHomeState(this.adminEmail, this.gameId);
}

class _UserHomeState extends State<UserHome> {
  String adminEmail;
  String gameId;

  _UserHomeState(this.adminEmail, this.gameId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ゲームページ'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Center(
          child: Text('User Home $adminEmail, '
              'Game ID is $gameId'),
        ),
      ),
    );
  }
}
