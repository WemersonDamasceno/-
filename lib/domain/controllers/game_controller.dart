import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_sounds.dart';

class GameController extends ChangeNotifier {
  static final GameController instance = GameController._();

  GameController._();

  List<String> board = List.generate(9, (index) => '');
  List<int> moveHistoryX = [];
  List<int> moveHistoryO = [];
  String currentPlayer = 'X';
  String winner = '';

  int qtdWinsPlayer1 = 0;
  int qtdWinsPlayer2 = 0;

  final AudioPlayer player = AudioPlayer();

  Future<void> handleTap(
      int index, BuildContext context, VoidCallback showDialogEndGame) async {
    if (board[index] == '' && winner == '') {
      await player.stop();
      await player.play(AssetSource(AppSounds.click1));

      board[index] = currentPlayer;

      List<int> currentHistory =
          currentPlayer == 'X' ? moveHistoryX : moveHistoryO;

      currentHistory.add(index);

      if (currentHistory.length > 3) {
        int removeIndex = currentHistory.removeAt(0);
        board[removeIndex] = '';
      }

      if (checkWinner(currentPlayer)) {
        await player.play(AssetSource(AppSounds.win));
        winner = currentPlayer;

        if (winner == 'X') {
          qtdWinsPlayer1++;
        } else {
          qtdWinsPlayer2++;
        }

        showDialogEndGame();

        resetGame();
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }

      notifyListeners();
    }
  }

  bool checkWinner(String player) {
    const List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    disposeController();
    notifyListeners();
  }

  void disposeGame() {
    qtdWinsPlayer1 = 0;
    qtdWinsPlayer2 = 0;

    disposeController();
  }

  void disposeController() {
    board = List.generate(9, (index) => '');

    moveHistoryX.clear();
    moveHistoryO.clear();
    currentPlayer = 'X';
    winner = '';
  }
}
