import 'package:flutter/material.dart';

import 'Targets.dart';

class TargetInfo {
  TargetInfo({
    @required this.name,
    @required this.emoji,
  });

  final String name;
  final String emoji;
}

class TargetService {
  final _targetList = [
    // for (int i; i < Targets.electrics.length; i++)
    //   {
    //     Targets.electrics[i],
    //   }
    Targets.electrics[0],
  ];

  int _currentEmojisIndex = 0;
  TargetInfo get targets {
    return TargetInfo(
      name: _targetList[_advanced()]['name'],
      emoji: _targetList[_advanced()]['emoji'],
    );
  }

  // TargetInfo get target => TargetInfo(name: , emoji: emoji)

  int _advanced() {
    _currentEmojisIndex++;
    return _currentEmojisIndex;
  }
}
