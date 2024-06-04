import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/constants/app_routes.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';
import 'package:tictactoe/presentation/choose_game_mode/mixins/choose_game_mode_mixin.dart';
import 'package:tictactoe/presentation/choose_game_mode/widgets/game_mode_item_widget.dart';

class ChooseGameModePage extends StatelessWidget with ChooseGameModeMixin {
  const ChooseGameModePage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight),
            const Text(
              "MODO DE JOGO",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Container(
              width: size.width * 0.25,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GameModeItemWidget(
                  image: AppImages.singlePlayerMode,
                  label: S.current.labelSinglePlayer,
                  onTap: () => showSnackbarWithMessage(context),
                  isEnable: false,
                ),
                GameModeItemWidget(
                  image: AppImages.multiPlayerMode,
                  label: S.current.labelMultiPlayer,
                  onTap: () => GoRouter.of(context).pushNamed(
                    AppRoutes.multiplayer,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GameModeItemWidget(
                  image: AppImages.challengeMode,
                  label: S.current.labelChallenge,
                  onTap: () => showSnackbarWithMessage(context),
                  isEnable: false,
                ),
                GameModeItemWidget(
                  image: AppImages.online,
                  label: S.current.labelPlayOnline,
                  isEnable: false,
                  onTap: () => showSnackbarWithMessage(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
