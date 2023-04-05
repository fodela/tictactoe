import 'dart:io';
import 'dart:math';

import 'package:tictactoe/game_board.dart';
import 'package:tictactoe/player.dart';

class Game {
  Player player1;
  Player player2;
  late Player currentPlayer;
  bool isPlay = true;

  Game(this.player1, this.player2) {
    currentPlayer = player1;
  }

  // bool is_start_game(){
  //   stdout
  // }

  void switch_player() {
    currentPlayer = currentPlayer == player1 ? player2 : player1;
  }

  void display_score() {
    print(
        "${player1.name}  ${player1.score} : ${player2.score}  ${player2.name}");
  }

  void play_game() {
    GameBoard board = GameBoard();

    display_score();

    while (isPlay) {
      board.display_board();

      board.make_move(currentPlayer);

      // check win
      if (board.is_winner(currentPlayer.symbol)) {
        // yes -> declare
        currentPlayer.winRound();
        display_score();

        break;
      }
      // no --> check full board
      if (board.is_board_full()) {
        // yes -> is a draw
        print("It is a tie");
        display_score();
        break;
      }
      // no win or draw continue

      switch_player();
    }
  }
}
