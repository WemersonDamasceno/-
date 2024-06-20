import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/constants/app_routes.dart';
import 'package:tictactoe/core/mixins/snackbar_mixin.dart';
import 'package:tictactoe/core/widgets/banner_widget.dart';
import 'package:tictactoe/core/widgets/game_mode_item_widget.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';

class InsaneGameModePage extends StatelessWidget with SnackbarMixin {
  const InsaneGameModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Wrap(
          runSpacing: 25,
          spacing: 20,
          children: [
            GameModeItemWidget(
              image: AppImages.singlePlayerMode,
              label: S.current.labelSinglePlayer,
              banner: BannerWidget(
                color: AppColors.primary,
                label: S.current.labelInsaneMode,
              ),
              onTap: () => GoRouter.of(context).pushNamed(
                AppRoutes.singlePlayer,
                extra: true,
              ),
            ),
            GameModeItemWidget(
              image: AppImages.multiPlayerMode,
              label: S.current.labelMultiPlayer,
              banner: BannerWidget(
                color: AppColors.primary,
                label: S.current.labelInsaneMode,
              ),
              onTap: () => GoRouter.of(context).pushNamed(
                AppRoutes.multiplayer,
                extra: true,
              ),
            ),
            GameModeItemWidget(
              image: AppImages.online,
              label: S.current.labelPlayOnline,
              banner: BannerWidget(
                color: const Color.fromARGB(255, 255, 30, 180),
                label: S.current.labelCommingSoon,
              ),
              isEnable: false,
              onTap: () => showSnackbarWithMessage(
                context: context,
                message: S.current.labelOptionIndefine,
                messageSnackbarEnum: MessageSnackbarEnum.info,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
