import 'dart:math';

class MakeRandomGameNumber {
  int getRandGameNum() {
    var rand = new Random();
    var next = rand.nextDouble() * 100000000;
    while (next < 10000000) {
      next *= 10;
    }
    var gameNumber = next.toInt();

    return gameNumber;
  }
}
