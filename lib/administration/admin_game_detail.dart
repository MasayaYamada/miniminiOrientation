import 'package:flutter/material.dart';
import 'package:mini_orientailing/administration/admin_add_times.dart';

class AdminGameDetails extends StatefulWidget {
  final String email;
  final String gameId;

  AdminGameDetails({this.email, this.gameId});

  @override
  _AdminGameDetailsState createState() =>
      _AdminGameDetailsState(this.email, this.gameId);
}

class _AdminGameDetailsState extends State<AdminGameDetails> {
  String email;
  String gameId;

  _AdminGameDetailsState(this.email, this.gameId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ゲーム設定画面"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() {
              Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                  settings: const RouteSettings(name: "/adminAddItems"),
                  builder: (BuildContext context) => AdminAddItems(
                    email: email,
                    gameId: gameId,
                  ),
                ),
              );
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
