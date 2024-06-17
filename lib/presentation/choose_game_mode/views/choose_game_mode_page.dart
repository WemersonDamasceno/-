import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/constants/app_routes.dart';
import 'package:tictactoe/core/widgets/title_page_widget.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';
import 'package:tictactoe/presentation/choose_game_mode/mixins/choose_game_mode_mixin.dart';
import 'package:tictactoe/presentation/choose_game_mode/widgets/game_mode_item_widget.dart';

class ChooseGameModePage extends StatefulWidget {
  const ChooseGameModePage({super.key});

  @override
  State<ChooseGameModePage> createState() => _ChooseGameModePageState();
}

class _ChooseGameModePageState extends State<ChooseGameModePage>
    with ChooseGameModeMixin {
  final GlobalKey _one = GlobalKey();
  BuildContext? myContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(const Duration(milliseconds: 200), () {
        ShowCaseWidget.of(myContext!).startShowCase([_one]);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShowCaseWidget(builder: (context) {
      myContext = context;
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kToolbarHeight),
              TitlePageWidget(
                label: S.current.labelGameMode,
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GameModeItemWidget(
                    image: AppImages.singlePlayerMode,
                    label: S.current.labelSinglePlayer,
                    onTap: () => GoRouter.of(context).pushNamed(
                      AppRoutes.singlePlayer,
                    ),
                  ),
                  Showcase(
                    key: _one,
                    title: S.current.labelMultiPlayerShowCase,
                    description: S.current.labelMultiPlayerShowCaseDescription,
                    child: GameModeItemWidget(
                      image: AppImages.multiPlayerMode,
                      label: S.current.labelMultiPlayer,
                      onTap: () => GoRouter.of(context).pushNamed(
                        AppRoutes.multiplayer,
                      ),
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
    });
  }
}
