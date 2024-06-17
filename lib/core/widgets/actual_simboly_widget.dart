import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tictactoe/core/widgets/board_widget.dart';
import 'package:tictactoe/core/widgets/simboly_item_widget.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';

class ActualSimbolyWidget extends StatelessWidget {
  final String symbol;
  final bool isOpaque;
  final GlobalKey oneKey;

  const ActualSimbolyWidget({
    super.key,
    required this.symbol,
    required this.isOpaque,
    required this.oneKey,
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
          child: Showcase(
            key: oneKey,
            title: S.current.labelAttention,
            description: S.current.labelAttentionDescription,
            child: SimbolyItemWidget(
              playerEnum: PlayerEnum.player1,
              isOpaque: isOpaque,
            ),
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
