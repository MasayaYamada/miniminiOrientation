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
            onPressed: () => setState(() {
              Navigator.of(context).pushNamed('/adminAddItems');
            }),
          ),
        ],
      ),
      body: Container(
        child: Container(
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(100, (index) {
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
