import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              child: Text(
                'ユーザーログイン画面',
                style: TextStyle(
                  color: Theme.of(context).textTheme.title.color,
                ),
              ),
              color: Colors.orange,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
