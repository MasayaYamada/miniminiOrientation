import 'package:flutter/material.dart';
import 'package:mini_orientailing/model/Item.dart';
import 'package:mini_orientailing/model/Targets.dart';

class CategoryInput extends StatefulWidget {
  @override
  _CategoryInputState createState() => _CategoryInputState();
}

class _CategoryInputState extends State<CategoryInput> {
  var item = new Item();
  var targets = new Targets();
  var itemList = [];

  var _currentEmojiIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
