import 'dart:io';

import 'package:flutter/foundation.dart';

import '../model/Item.dart';

class GameItems with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage, int pickedPoint) {
    final newPlace = Item(
      id: DateTime.now().toString(),
      name: pickedTitle,
      point: pickedPoint,
      image: pickedImage,
    );
    notifyListeners();
    // DBHelper.insert('places', {
    //   'id': newPlace.id,
    //   'title': newPlace.name,
    //   'point': newPlace.point,
    //   'image': newPlace.image.path
    // });
  }
}
