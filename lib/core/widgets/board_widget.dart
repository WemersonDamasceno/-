import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/mixins/dialog_mixin.dart';
import 'package:tictactoe/core/widgets/background_gradient_widget.dart';
import 'package:tictactoe/domain/controllers/game_controller.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';

enum GameModeEnum { singlePlayer, multiPlayer }

class BoardWidget extends StatefulWidget {
  final GameModeEnum gameModeEnum;

  const BoardWidget({
    required this.gameModeEnum,
    super.key,
  });

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> with DialogMixin {
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
    return ShowCaseWidget(builder: (context) {
      myContext = context;
      return BackgroundGradientWidget(
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            margin: const EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
              minHeight: constraints.minWidth,
              minWidth: constraints.minWidth,
            ),
            child: Consumer<GameController>(builder: (_, gameController, __) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                ),
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async => await gameController.handleTap(
                      index,
                      context,
                      () {
                        showDialogEndGame(
                          context: context,
                          winner: gameController.winner == 'X' ? 1 : 2,
                        );
                      },
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.5),
                            offset: const Offset(0, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Builder(
                        builder: (context) {
                          final symbol = gameController.board[index];
                          final isOpaque = ((symbol == 'X' &&
                                  gameController.moveHistoryX.length > 2 &&
                                  gameController.moveHistoryX[0] == index &&
                                  gameController.currentPlayer == 'X') ||
                              (symbol == 'O' &&
                                  gameController.moveHistoryO.length > 2 &&
                                  gameController.moveHistoryO[0] == index &&
                                  gameController.currentPlayer == 'O'));
                          switch (symbol) {
                            case 'X':
                              return Visibility(
                                visible: isOpaque,
                                replacement: Center(
                                  child: SvgPicture.asset(
                                    AppImages.x,
                                    height: 50,
                                    width: 50,
                                    colorFilter: ColorFilter.mode(
                                      isOpaque
                                          ? AppColors.primary.withOpacity(0.5)
                                          : AppColors.primary,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                child: Showcase(
                                  key: _one,
                                  title: S.current.labelAttention,
                                  description:
                                      S.current.labelAttentionDescription,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppImages.x,
                                      height: 50,
                                      width: 50,
                                      colorFilter: ColorFilter.mode(
                                        isOpaque
                                            ? AppColors.primary.withOpacity(0.5)
                                            : AppColors.primary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            case 'O':
                              return Center(
                                child: SvgPicture.asset(AppImages.o,
                                    height: 50,
                                    width: 50,
                                    colorFilter: ColorFilter.mode(
                                      isOpaque
                                          ? AppColors.secondary.withOpacity(0.5)
                                          : AppColors.secondary,
                                      BlendMode.srcIn,
                                    )),
                              );
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  );
                },
              );
            }),
          );
        }),
      );
    });
  }
}
