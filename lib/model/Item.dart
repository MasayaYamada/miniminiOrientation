import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Item {
  String id;
  String name;
  int point;
  Image image;

  Item({
    @required this.id,
    @required this.name,
    @required this.point,
    @required this.image,
  });
}
