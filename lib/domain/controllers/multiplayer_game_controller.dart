import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_sounds.dart';
import 'package:tictactoe/domain/controllers/base_game_controller.dart';

class MultiPlayerController extends GameController {
  @override
  Future<void> handleTap(int index, BuildContext context,
      VoidCallback showDialogEndGame, bool isInsaneMode) async {
    if (board[index] == '' && winner == '') {
      await player.stop();
      await player.play(AssetSource(AppSounds.click1));

      board[index] = currentPlayer;

      if (isInsaneMode) {
        List<int> currentHistory =
            currentPlayer == 'X' ? moveHistoryX : moveHistoryO;

        currentHistory.add(index);
        if (currentHistory.length > 3) {
          int removeIndex = currentHistory.removeAt(0);
          board[removeIndex] = '';
        }
      }

      if (checkWinner(currentPlayer)) {
        await player.play(AssetSource(AppSounds.win));
        winner = currentPlayer;

        if (winner == 'X') {
          qtdWinsPlayer1++;
        } else {
          qtdWinsPlayer2++;
        }

        board = List.generate(9, (index) => '');

        if (winner == 'X') {
          moveHistoryO.clear();

          for (int i = 0; i < moveHistoryX.length; i++) {
            board[moveHistoryX[i]] = 'X';
          }
        } else {
          moveHistoryX.clear();
          for (int i = 0; i < moveHistoryO.length; i++) {
            board[moveHistoryO[i]] = 'O';
          }
        }

        notifyListeners();

        Future.delayed(const Duration(milliseconds: 1000), () {
          showDialogEndGame();
          resetGame();
        });

        return;
      } else if (!board.contains('')) {
        // Verifica se deu empate
        await player.play(AssetSource(AppSounds.win));
        notifyListeners();

        Future.delayed(const Duration(milliseconds: 500), () {
          showDialogEndGame();
          resetGame();
        });

        return;
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }

      notifyListeners();
    }
  }
}
