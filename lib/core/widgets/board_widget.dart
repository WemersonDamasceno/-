import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/mixins/dialog_mixin.dart';
import 'package:tictactoe/core/widgets/actual_simboly_widget.dart';
import 'package:tictactoe/core/widgets/background_gradient_widget.dart';
import 'package:tictactoe/domain/controllers/game_controller.dart';

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
          child: LayoutBuilder(builder: (_, constraints) {
        return Container(
          margin: const EdgeInsets.all(10),
          constraints: BoxConstraints(
            maxHeight: constraints.maxHeight,
            maxWidth: constraints.maxWidth,
            minHeight: constraints.minWidth,
            minWidth: constraints.minWidth,
          ),
          child: Consumer<GameController>(builder: (_, controller, __) {
            return GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final String symbol = controller.board[index];
                  final bool isOpaque = checkIfOpaque(
                    symbol: symbol,
                    index: index,
                    board: controller,
                  );

                  return GestureDetector(
                    onTap: () async => await controller.handleTap(
                      index,
                      context,
                      () {
                        showDialogEndGame(
                          context: context,
                          winner: controller.winner == 'X' ? 1 : 2,
                        );
                      },
                      widget.gameModeEnum,
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
                            )
                          ]),
                      child: ActualSimbolyWidget(
                        oneKey: _one,
                        symbol: symbol,
                        isOpaque: isOpaque && controller.winner.isEmpty,
                      ),
                    ),
                  );
                });
          }),
        );
      }));
    });
  }

  bool checkIfOpaque({
    required GameController board,
    required String symbol,
    required int index,
  }) {
    if ((symbol == 'X' && board.currentPlayer == 'X') ||
        (symbol == 'O' && board.currentPlayer == 'O')) {
      List<int> moveHistory =
          symbol == 'X' ? board.moveHistoryX : board.moveHistoryO;

      if (moveHistory.length > 2 && moveHistory[0] == index) {
        return true;
      }
    }
    return false;
  }
}

enum GameModeEnum {
  singlePlayer,
  multiPlayer,
}

enum PlayerEnum {
  player1(color: AppColors.primary, symbol: AppImages.x),
  player2(color: AppColors.secondary, symbol: AppImages.o);

  final Color color;
  final String symbol;

  const PlayerEnum({
    required this.color,
    required this.symbol,
  });
}
