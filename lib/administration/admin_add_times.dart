import 'package:flutter/material.dart';

class AdminAddItems extends StatefulWidget {
  @override
  _AdminAddItemsState createState() => _AdminAddItemsState();
}

class _AdminAddItemsState extends State<AdminAddItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("画像登録画面"),
      ),
    );
  }
}
