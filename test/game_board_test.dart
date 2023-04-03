import "dart:io";

import "package:test/test.dart";
import "package:tictactoe/game_board.dart";
import "package:tictactoe/player.dart";

void main() {
  test("GameBoard has a board", () {
    expect(GameBoard().board, [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
    ]);
  });

  test("display board", () {
    expect(() => GameBoard().display_board(), prints("""
1 | 2 | 3
__________
4 | 5 | 6
__________
7 | 8 | 9
__________
"""));
  });

  group('is a space on the board empty', () {
    final testBoard = GameBoard();
    testBoard.board = [
      ["x", "x", "3"],
      ["o", "5", "x"],
      ["x", "x", "o"]
    ];

    test("space taken", () {
      expect(testBoard.is_space_empty(9), false);
      expect(testBoard.is_space_empty(6), false);
    });

    test("space is empty", () {
      expect(testBoard.is_space_empty(3), true);
      expect(testBoard.is_space_empty(5), true);
    });
  });

  group('check win', () {
    test('row', () {
      var testBoard = GameBoard();
      testBoard.board = [
        ["x", "x", "x"],
        ["x", "o", "o"],
        ["o", "x", "o"]
      ];

      expect(testBoard.is_winner("x"), true);
    });
    test('column', () {
      var testBoard = GameBoard();
      testBoard.board = [
        ["x", "x", "o"],
        ["x", "o", "o"],
        ["x", "o", "x"]
      ];

      expect(testBoard.is_winner("x"), true);
    });
    test('major diagonal', () {
      var testBoard = GameBoard();
      testBoard.board = [
        ["o", "x", "x"],
        ["x", "o", "o"],
        ["o", "x", "o"]
      ];

      expect(testBoard.is_winner("o"), true);
    });
    test('minor diagonal', () {
      var testBoard = GameBoard();
      testBoard.board = [
        ["o", "x", "o"],
        ["x", "o", "o"],
        ["o", "x", "x"]
      ];

      expect(testBoard.is_winner("o"), true);
    });
  });

  test("board is full", () {
    final testBoard = GameBoard();
    testBoard.board = [
      ["x", "x", "o"],
      ["o", "o", "x"],
      ["x", "x", "o"]
    ];
    print(testBoard);
    expect(testBoard.is_board_full(), true);
  });

  group('make move', () {
    // stdout.write("Enter 5: ");
    Player testPlayer = Player("testPlayer", "x");
    GameBoard testBoard = GameBoard();
    testBoard.make_move(testPlayer);
    GameBoard expectedBoard = GameBoard();
    expectedBoard.board = [
      ["1", "2", "3"],
      ["4", "x", "6"],
      ["7", "8", "9"],
    ];
    test('at 5', () {
      expect(() => print(testBoard.board), prints("${expectedBoard.board}\n"));
    });
  });
}
