import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictactoe/core/widgets/board_widget.dart';

class SimbolyItemWidget extends StatelessWidget {
  final bool isOpaque;
  final PlayerEnum playerEnum;

  const SimbolyItemWidget({
    super.key,
    required this.isOpaque,
    required this.playerEnum,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        playerEnum.symbol,
        height: 50,
        width: 50,
        colorFilter: ColorFilter.mode(
          isOpaque ? playerEnum.color.withOpacity(0.5) : playerEnum.color,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
