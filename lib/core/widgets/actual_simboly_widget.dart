import 'package:flutter/material.dart';
import 'package:tictactoe/core/widgets/board_widget.dart';
import 'package:tictactoe/core/widgets/simboly_item_widget.dart';

class ActualSimbolyWidget extends StatelessWidget {
  final String symbol;
  final bool isOpaque;

  const ActualSimbolyWidget({
    super.key,
    required this.symbol,
    required this.isOpaque,
  });

  @override
  Widget build(BuildContext context) {
    switch (symbol) {
      case 'X':
        return Visibility(
          visible: isOpaque,
          replacement: SimbolyItemWidget(
            playerEnum: PlayerEnum.player1,
            isOpaque: isOpaque,
          ),
          child: SimbolyItemWidget(
            playerEnum: PlayerEnum.player1,
            isOpaque: isOpaque,
          ),
        );
      case 'O':
        return SimbolyItemWidget(
          playerEnum: PlayerEnum.player2,
          isOpaque: isOpaque,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
