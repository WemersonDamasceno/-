import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/widgets/snackbar_widget.dart';

mixin ChooseGameModeMixin {
  showSnackbarWithMessage(BuildContext context) {
    return SnackBarWidget(
      context: context,
      snackbarIcon: Icons.info_outline_rounded,
      labelSnackbar: "Opção indisponível no momento!",
      labelButton: "Fechar",
      snackbarBackgroundColor: AppColors.snackbarBackground,
      snackbarFontColor: Colors.white,
      buttonBackgroundColor: AppColors.snackbarBackgroundButton,
      buttonFontColor: Colors.white,
      buttonCallback: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ).show();
  }
}
