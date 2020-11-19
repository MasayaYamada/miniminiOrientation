import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../controller/camera_controller.dart';

class AdminAddItems extends StatefulWidget {
  final String email;
  final String gameId;

  AdminAddItems({@required this.email, @required this.gameId});

  @override
  _AdminAddItemsState createState() =>
      _AdminAddItemsState(this.email, this.gameId);
}

class _AdminAddItemsState extends State<AdminAddItems> {
  String email;
  String gameId;

  final _titleController = TextEditingController();
  final _pickedPoint = TextEditingController();
  File _pickedImage;

  final fireStoreInstance = FirebaseFirestore.instance;

  _AdminAddItemsState(this.email, this.gameId);

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedPoint == null) {
      return;
    }

    uploadFile();
    Navigator.of(context).pop();
  }

  void uploadFile() async {
    final ref =
        FirebaseStorage.instance.ref().child('item_image').child('test.jpg');
    final storedImage = await ref.putFile(_pickedImage);

    final String downloadUrl = await loadImage(storedImage);

    fireStoreInstance
        .collection(email)
        .doc(gameId)
        .collection('items')
        .doc(_titleController.toString())
        .set({
      'imageTitle': _titleController.toString(),
      'imagePoint': _pickedPoint.toString(),
      'imageURL': downloadUrl
    }).then((_) {
      print("insert success!");
    });
  }

  Future<String> loadImage(storedImage) async {
    if (storedImage.error == null) {
      print('storageに保存しました');
      final String downloadUrl = await storedImage.ref.getDownloadURL();
      return downloadUrl;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
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
                        labelText: '写真タイトル',
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
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('登録'),
            onPressed: _savePlace,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
