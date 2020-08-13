import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '管理者ログイン画面',
              style: TextStyle(
                color: Theme.of(context).textTheme.title.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
