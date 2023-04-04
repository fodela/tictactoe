import 'package:test/test.dart';
import 'package:tictactoe/player.dart';

void main() {
  final testPlayer = Player("Test player", "X");
  test(
      "valid player",
      () => expect(() => print(testPlayer),
          prints("Test player has symbol X and a score 0\n")));

  test('player wins round', () {
    testPlayer.winRound();
    testPlayer.winRound();
    expect(testPlayer.score, 2);
  });
}
