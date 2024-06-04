import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/widgets/background_gradient_widget.dart';

class BoardWidget extends StatelessWidget {
  final List<String> board;
  final List<int> moveHistoryX;
  final List<int> moveHistoryO;
  final String currentPlayer;
  final Function(int) handleTap;

  const BoardWidget({
    super.key,
    required this.board,
    required this.moveHistoryX,
    required this.moveHistoryO,
    required this.currentPlayer,
    required this.handleTap,
  });

  @override
  Widget build(BuildContext context) {
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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
            ),
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => handleTap(index),
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
                      final symbol = board[index];
                      final isOpaque = ((symbol == 'X' &&
                              moveHistoryX.length > 2 &&
                              moveHistoryX[0] == index &&
                              currentPlayer == 'X') ||
                          (symbol == 'O' &&
                              moveHistoryO.length > 2 &&
                              moveHistoryO[0] == index &&
                              currentPlayer == 'O'));
                      switch (symbol) {
                        case 'X':
                          return Center(
                            child: SvgPicture.asset(AppImages.x,
                                height: 50,
                                width: 50,
                                colorFilter: ColorFilter.mode(
                                  isOpaque
                                      ? AppColors.primary.withOpacity(0.5)
                                      : AppColors.primary,
                                  BlendMode.srcIn,
                                )),
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
          ),
        );
      }),
    );
  }
}
