import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Game {
  String gameId;
  String gameName;

  final fireStoreInstance = FirebaseFirestore.instance;

  Game({
    @required this.gameId,
    @required this.gameName,
  });
}
