import 'dart:io';
import "package:collection/collection.dart";

import 'package:tictactoe/game.dart';
import 'package:tictactoe/game_board.dart';
import 'package:tictactoe/player.dart';

void main(List<String> arguments) {
  print("Welcome to Tic Tac Toe 🎮\n");
  bool start = true;
  stdout.write("Player1 please enter your name: ");
  String? name1 = stdin.readLineSync();

  stdout.write("Player2 please enter your name: ");
  String? name2 = stdin.readLineSync();

  Player player1 = Player("1️⃣$name1", "x");
  Player player2 = Player("2️⃣$name2", "o");
  while (start) {
    start = false;
    Game(player1, player2).play_game();

    stdout.write("Would you like a rematch? y/n: ");
    String? res = stdin.readLineSync();
    if (res!.toLowerCase()[0] == "y") {
      start = true;
    }
  }
}
