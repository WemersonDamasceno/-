import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/widgets/button_large_widget.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';

mixin DialogMixin {
  showDialogEndGame({required BuildContext context, required int winner}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            S.current.labelPlayerNWinner(winner),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: Image.asset(
            AppImages.win,
            width: 100,
            height: 100,
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
}
