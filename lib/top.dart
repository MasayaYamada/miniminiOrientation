import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Text(
              'ミニミニオリエンテーリング',
              style: TextStyle(
                color: Theme.of(context).textTheme.title.color,
              ),
            ),
            Row(
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text('ユーザー'),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('管理者'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
