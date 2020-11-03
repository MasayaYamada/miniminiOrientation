import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_orientailing/controller/make_random_game_number.dart';

class AdminAddGames extends StatefulWidget {
  final String email;

  AdminAddGames({@required this.email});

  @override
  State<StatefulWidget> createState() {
    return _AdminAddGamesState(this.email);
  }
}

class _AdminAddGamesState extends State<AdminAddGames> {
  // final _formKey = GlobalKey<FormState>();
  String email;
  var _gameTitle = TextEditingController();
  final fireStoreInstance = FirebaseFirestore.instance;
  var _text = '';

  MakeRandomGameNumber makeRandomGameNumber = new MakeRandomGameNumber();

  _AdminAddGamesState(this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ゲーム登録画面"),
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            TextField(
              maxLength: 20,
              maxLengthEnforced: false,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: 'ゲーム名を登録して下さい',
                labelText: 'ゲーム名 *',
              ),
              controller: _gameTitle,
            ),
            RaisedButton(
              onPressed: _submission,
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  void _submission() {
    int randomNam = makeRandomGameNumber.getRandGameNum();

    setState(() {
      _text = _gameTitle.text;

      fireStoreInstance
          .collection(email)
          .doc(randomNam.toString())
          .set({'gameName': _text, 'gameId': randomNam.toString()}).then((_) {
        print("insert game detail");
      });
    });
    Navigator.of(context).pop();
  }
}
