import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/mixins/snackbar_mixin.dart';
import 'package:tictactoe/core/widgets/title_page_widget.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';
import 'package:tictactoe/core/widgets/game_mode_item_widget.dart';

class MyChallengersPage extends StatelessWidget with SnackbarMixin {
  const MyChallengersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitlePageWidget(
              label: S.current.labelChallenge,
            ),
            SizedBox(height: size.height * 0.05),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GameModeItemWidget(
                  image: AppImages.firstWin,
                  label: "VENÇA SEU PRIMEIRO JOGO",
                ),
                GameModeItemWidget(
                  image: AppImages.threeWins,
                  label: "VENÇA TRÊS VEZES SEGUIDAS",
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GameModeItemWidget(
                  image: AppImages.winPlayerIA,
                  label: "VENÇA A IA 3 VEZES",
                ),
                GameModeItemWidget(
                  image: AppImages.fivePlayerWin,
                  label: "VENÇA COM 5 JOGADAS",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
