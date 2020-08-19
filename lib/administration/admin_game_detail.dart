import 'package:flutter/material.dart';

class AdminGameDetails extends StatefulWidget {
  @override
  _AdminGameDetailsState createState() => _AdminGameDetailsState();
}

class _AdminGameDetailsState extends State<AdminGameDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ゲーム設定画面"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() {}),
          ),
        ],
      ),
    );
  }
}
