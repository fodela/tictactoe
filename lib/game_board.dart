import 'dart:io';
import 'package:tictactoe/player.dart';
import "package:collection/collection.dart";

Map<int, List<int>> points = {
  1: [0, 0],
  2: [0, 1],
  3: [0, 2],
  4: [1, 0],
  5: [1, 1],
  6: [1, 2],
  7: [2, 0],
  8: [2, 1],
  9: [2, 2],
};

class GameBoard {
  List<List<String>> board = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
  ];

  void display_board() {
    for (var row in board) {
      print(row.join(" | "));
      print("__________");
    }
  }

  bool is_space_empty(int position) {
    int? row = points[position]?.elementAt(0);
    int? col = points[position]?.elementAt(1);
    return row != null &&
        col != null &&
        board[row][col].toLowerCase() != "x" &&
        board[row][col].toLowerCase() != "o";
  }

  void make_move(Player player) {
    var position = null;

    stdout.write(
        "${player.name} please enter you move (1-9) that is not taken: ");
    while (position == null) {
      try {
        var input = player.play();

        if (input.runtimeType == String) {
          position = int.parse(input!);
          if (position >= 1 && position <= 9) {
            if (is_space_empty(position)) {
              int? row = points[position]?.elementAt(0);
              int? col = points[position]?.elementAt(1);
              board[row!][col!] = player.symbol;
              break;
            } else {
              position = null;
              throw "Position $position  is taken. ${player.name} enter your move (1-9) that is not taken: ";
            }
          }
          position = null;
          throw "Invalid entry, ${player.name} enter your move (1-9) that is not taken: ";
        } else {
          // Input is null or cannot be parsed as an integer
          stdout.write(
              "Invalid Entry --$input. Enter your move (1-9) that is not taken: ");
        }
      } catch (error) {
        stdout.write(
            "Invalid input. ${player.name} Re-enter your move (1-9) that is not taken: ");
      }
    }
  }

  bool is_board_full() {
    for (List<String> row in board) {
      for (String symbol in row) {
        if (symbol.toLowerCase() != "x") {
          if (symbol.toLowerCase() != "o") {
            return false;
          }
        }
      }
    }

    return true;
  }

  bool is_winner(String symbol) {
    // Initialize list equality checker
    ListEquality<String> listEquality = ListEquality<String>();

    List<String> match = [symbol, symbol, symbol];

    // check rows
    for (var row in board) {
      if (listEquality.equals(row, match)) {
        return true;
      }
    }
    // check columns
    for (int row = 0; row < 3; row++) {
      List<String> column = [];
      for (int col = 0; col < 3; col++) {
        column.add(board[col][row]);
      }
      if (listEquality.equals(column, match)) {
        return true;
      }
    }

    // check diagonals
    List<String> majorDiagonal = [];
    for (int i = 0; i < 3; i++) {
      majorDiagonal.add(board[i][i]);
    }
    if (listEquality.equals(majorDiagonal, match)) {
      return true;
    }

    List<String> minorDiagonal = [];
    int row = 0;
    for (int col = 2; col >= 0; col--) {
      minorDiagonal.add(board[row][col]);
      row += 1;
    }
    if (listEquality.equals(minorDiagonal, match)) {
      return true;
    }

    return false;
  }
}
