import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/mixins/dialog_mixin.dart';
import 'package:tictactoe/core/widgets/board_widget.dart';
import 'package:tictactoe/core/widgets/card_scoreboard_widget.dart';
import 'package:tictactoe/core/widgets/title_page_widget.dart';
import 'package:tictactoe/domain/controllers/game_controller.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';

class MultiPlayerModePage extends StatefulWidget {
  const MultiPlayerModePage({super.key});

  @override
  State<MultiPlayerModePage> createState() => _MultiPlayerModePageState();
}

class _MultiPlayerModePageState extends State<MultiPlayerModePage>
    with DialogMixin {
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
  void dispose() {
    GameController.instance.disposeGame();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(builder: (context) {
      myContext = context;
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Consumer<GameController>(builder: (context, gameController, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitlePageWidget(
                  label: S.current.labelScoreboard,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Showcase(
                      key: _one,
                      title: S.current.labelScoreboardShowCase,
                      description: S.current.labelScoreboardShowCaseDescription,
                      child: CardScoreboardWidget(
                        color: AppColors.secondary,
                        player: 'Player 1',
                        score: gameController.qtdWinsPlayer1,
                        image: AppImages.x,
                      ),
                    ),
                    CardScoreboardWidget(
                      color: AppColors.primary,
                      player: 'Player 2',
                      score: gameController.qtdWinsPlayer2,
                      image: AppImages.o,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const BoardWidget(
                  gameModeEnum: GameModeEnum.multiPlayer,
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}
