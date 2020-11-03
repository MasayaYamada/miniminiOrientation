import 'package:flutter/material.dart';
import 'package:mini_orientailing/controller/camera_controller.dart';

class AdminAddItems extends StatefulWidget {
  @override
  _AdminAddItemsState createState() => _AdminAddItemsState();
}

class _AdminAddItemsState extends State<AdminAddItems> {
  CameraSubmitApp CameraApp = new CameraSubmitApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("画像登録画面"),
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () {
                //TODO: work camera
                CameraApp;
              },
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('登録'),
            )
          ],
        ),
      ),
    );
  }
}
