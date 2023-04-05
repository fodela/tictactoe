import 'package:test/scaffolding.dart';
import 'package:test/test.dart';
import 'package:tictactoe/game.dart';
import 'package:tictactoe/player.dart';

void main() {
  group("switch player", () {
    Player playerOne = Player("playerOne", "x");
    Player playerTwo = Player("playerTwo", "o");
    Game game = Game(playerOne, playerTwo);
    game.currentPlayer = playerOne;
    test("switch to playerTwo", () {
      game.switch_player();
      expect(game.currentPlayer, playerTwo);
    });
    test("switch back to playerOne", () {
      game.switch_player();
      expect(game.currentPlayer, playerOne);
    });
  });

  test("display score", () {
    final p1 = Player("player1", "x");
    final p2 = Player("player2", "o");

    expect(
        () => Game(p1, p2).display_score(), prints("player1 0 : 0 player2\n"));
  });
}
