import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_orientailing/model/TargetInfo.dart';

class AdminAddItems extends StatefulWidget {
  final String email;
  final String gameId;
  final String emoji;
  final String emojiName;

  AdminAddItems({this.email, this.gameId, this.emoji, this.emojiName});

  @override
  _AdminAddItemsState createState() =>
      _AdminAddItemsState(this.email, this.gameId, this.emoji, this.emojiName);
}

class _AdminAddItemsState extends State<AdminAddItems> {
  String email;
  String gameId;
  String emoji;
  String emojiName;

  final _titleController = TextEditingController();
  final _pickedPoint = TextEditingController();
  // when I user camera
  // File _pickedImage;

  final fireStoreInstance = FirebaseFirestore.instance;

  _AdminAddItemsState(this.email, this.gameId, this.emoji, this.emojiName);

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        emojiName == null ||
        emoji == null ||
        _pickedPoint == null) {
      return;
    }

    uploadFile();
    Navigator.of(context).pop();
  }

  void getEmoji() {
    print(TargetService().targets.name.toString());
    print(TargetService().targets.emoji.toString());
  }

  void uploadFile() {
    DateTime date = DateTime.now();
    String itemID = "${date.hour}${date.minute}${date.second}";

    try {
      fireStoreInstance
          .collection(email)
          .doc(gameId)
          .collection("items")
          .doc(_titleController.text)
          .set({
        "itemId": itemID,
        "itemTitle": _titleController.text,
        "itemPoint": _pickedPoint.text,
        "emoji": emoji,
        "emojiName": emojiName,
      }).then((_) {
        print("insert success!");
      });
    } catch (onError) {
      print("Down load Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アイテムの追加画面'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'タイトル',
                      ),
                      controller: _titleController,
                    ),
                    TextField(
                      controller: _pickedPoint,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'ポイント',
                      ),
                    ),
                    Row(children: [
                      SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: Card(
                          child: Center(
                            child: Text(
                              emoji ?? '',
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        child: const Text('カテゴリの選択'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange, onPrimary: Colors.white),
                        onPressed: () {
                          Navigator.pushNamed(context, '/adminCategoryPicker')
                              .then((value) {
                            setState(() {
                              emoji = (value as Map)['emoji'];
                              emojiName = (value as Map)['emojiName'];
                            });
                          });
                        },
                      ),
                    ]),
                    // ImageInput(_selectImage),n
                    // CategoryInput(_selectEmoji),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('登録'),
            onPressed: () {
              debugPrint(emojiName);
              _savePlace();
            },
            // style: MaterialTapTargetSize.shrinkWrap,
            // color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
