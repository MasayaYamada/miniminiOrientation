import 'package:flutter/material.dart';

class AdminAddGames extends StatefulWidget {
  @override
  _AdminAddGamesState createState() => _AdminAddGamesState();
}

class _AdminAddGamesState extends State<AdminAddGames> {
  // final _formKey = GlobalKey<FormState>();
  String _gameTitle = '';

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
            TextFormField(
              maxLength: 20,
              maxLengthEnforced: false,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: 'ゲーム名を登録して下さい',
                labelText: 'ゲーム名 *',
              ),
              validator: (String value) {
                return value.isEmpty ? '必須入力です' : null;
              },
              onSaved: (String value) {
                this._gameTitle = value;
              },
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
    // if (this._formKey.currentState.validate()) {
    //   Scaffold.of(context)
    //       .showSnackBar(SnackBar(content: Text('Processing Data')));
    print(this._gameTitle);
    // }
  }
}
