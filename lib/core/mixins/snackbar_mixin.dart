import 'package:flutter/material.dart';
import 'package:tictactoe/core/widgets/snackbar_widget.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';

mixin SnackbarMixin {
  showSnackbarWithMessage({
    required BuildContext context,
    required String message,
    required MessageSnackbarEnum messageSnackbarEnum,
  }) {
    return SnackBarWidget(
      context: context,
      snackbarIcon: Icons.info_outline_rounded,
      labelButton: S.current.labelClose,
      labelSnackbar: message,
      snackbarBackgroundColor: messageSnackbarEnum.backgroundColor,
      snackbarFontColor: messageSnackbarEnum.labelColor,
      buttonBackgroundColor: messageSnackbarEnum.buttonBackgroundColor,
      buttonFontColor: messageSnackbarEnum.buttonColor,
      buttonCallback: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ).show();
  }
}

enum MessageSnackbarEnum {
  error(
    labelColor: Colors.white,
    backgroundColor: Colors.red,
    buttonColor: Colors.white,
    buttonBackgroundColor: Colors.red,
  ),
  success(
    labelColor: Colors.white,
    backgroundColor: Colors.green,
    buttonColor: Colors.white,
    buttonBackgroundColor: Colors.green,
  ),
  info(
    labelColor: Colors.white,
    backgroundColor: Colors.blue,
    buttonColor: Colors.white,
    buttonBackgroundColor: Colors.blue,
  ),
  warning(
    labelColor: Colors.white,
    backgroundColor: Colors.orange,
    buttonColor: Colors.white,
    buttonBackgroundColor: Colors.orange,
  );

  final Color labelColor;
  final Color backgroundColor;
  final Color buttonColor;
  final Color buttonBackgroundColor;

  const MessageSnackbarEnum({
    required this.labelColor,
    required this.backgroundColor,
    required this.buttonColor,
    required this.buttonBackgroundColor,
  });
}
