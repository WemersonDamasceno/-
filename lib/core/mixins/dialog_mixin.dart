import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/widgets/board_widget.dart';
import 'package:tictactoe/core/widgets/button_large_widget.dart';
import 'package:tictactoe/domain/controllers/base_game_controller.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';

mixin DialogMixin {
  void showDialogEndGame({
    required BuildContext context,
    required GameController gameController,
    required GameModeEnum gameModeEnum,
  }) {
    final endGameData = _getEndGameData(gameController, gameModeEnum);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: FittedBox(
            child: Text(
              endGameData.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          content: Image.asset(
            endGameData.image,
            width: 150,
            height: 150,
          ),
          actions: [
            ButtonLargeWidget.fill(
              label: S.current.labelTryAgain,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  _EndGameData _getEndGameData(
      GameController gameController, GameModeEnum gameModeEnum) {
    String winnerString;
    String image;
    String title;

    if (gameController.winner == "X") {
      winnerString = "X";
      image = AppImages.win;
      title = S.current.labelPlayerNWinner(winnerString);
    } else if (gameController.winner == "O") {
      winnerString = "O";
      image = AppImages.win;
      title = S.current.labelPlayerNWinner(winnerString);
    } else {
      image = AppImages.draw;
      winnerString = S.current.labelDrawTitle;
      title = S.current.labelDrawDescription;
    }

    if (gameModeEnum == GameModeEnum.singlePlayer &&
        gameController.winner == "O") {
      winnerString = S.current.labelComputer;
      image = AppImages.lose;
      title = S.current.labelYouLose;
    }

    return _EndGameData(title: title, image: image);
  }
}

class _EndGameData {
  final String title;
  final String image;

  _EndGameData({required this.title, required this.image});
}
