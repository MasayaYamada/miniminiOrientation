import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ミニミニオリエンテーリング',
              style: TextStyle(
                color: Theme.of(context).textTheme.title.color,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlatButton(
                  child: Text('ユーザー'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/userLogin');
                  },
                ),
                FlatButton(
                  child: Text('管理者'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/adminLogin');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
