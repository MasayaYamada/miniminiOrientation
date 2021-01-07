import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  final String adminEmail;

  UserHome({@required this.adminEmail});

  @override
  _UserHomeState createState() => _UserHomeState(this.adminEmail);
}

class _UserHomeState extends State<UserHome> {
  String adminEmail;

  _UserHomeState(this.adminEmail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ユーザーページ'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Center(
          child: Text('User Home $adminEmail'),
        ),
      ),
    );
  }
}
