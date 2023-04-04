import 'dart:io';

class Player {
  String? name;
  String symbol;
  int score = 0;

  Player(this.name, this.symbol);

  String? play() {
    var input = stdin.readLineSync();
    return input;
  }

  void winRound() {
    ++score;
    print("$name wins the round");
  }

  @override
  String toString() => "$name has symbol $symbol and a score $score";

  // display score
}
