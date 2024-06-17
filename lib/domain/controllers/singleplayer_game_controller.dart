import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_sounds.dart';
import 'package:tictactoe/domain/controllers/base_game_controller.dart';

class SinglePlayerController extends GameController {
  static final SinglePlayerController instance = SinglePlayerController._();

  bool isTapEnabled = true;

  SinglePlayerController._();

  @override
  Future<void> handleTap(
    int index,
    BuildContext context,
    VoidCallback showDialogEndGame,
  ) async {
    if (!isTapEnabled) {
      return;
    }
    isTapEnabled = false;
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

        Future.delayed(const Duration(milliseconds: 1500), () {
          showDialogEndGame();
          resetGame();
        });

        isTapEnabled = true;
        return;
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }

      notifyListeners();

      // Verifique se é a vez da IA
      if (currentPlayer == 'O') {
        Future.delayed(const Duration(milliseconds: 500), () {
          _makeAIMove(context, showDialogEndGame);

          isTapEnabled = true;
        });
      }
    }
  }

  Future<void> _makeAIMove(
      BuildContext context, VoidCallback showDialogEndGame) async {
    List<int> availableMoves = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] == '') {
        availableMoves.add(i);
      }
    }

    if (availableMoves.isNotEmpty) {
      int moveIndex = availableMoves[Random().nextInt(availableMoves.length)];
      await handleTap(moveIndex, context, showDialogEndGame);
    }
    isTapEnabled = true;
  }
}
