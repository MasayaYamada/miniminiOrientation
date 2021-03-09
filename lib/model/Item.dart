import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Item {
  String id;
  String name;
  int point;
  // String imageURL;
  String emojiName;
  String emoji;

  Item({
    @required this.id,
    @required this.name,
    @required this.point,
    @required this.emojiName,
    @required this.emoji,
    // @required this.imageURL,
  });
}
