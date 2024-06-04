import 'package:flutter/material.dart';
import 'package:tictactoe/presentation/multiplayer_mode/views/in_game_page.dart';

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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => handleTap(index),
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Builder(
              builder: (context) {
                final symbol = board[index];
                final isOpaque = (symbol == 'X' &&
                        moveHistoryX.length > 2 &&
                        moveHistoryX[0] == index &&
                        currentPlayer == 'X') ||
                    (symbol == 'O' &&
                        moveHistoryO.length > 2 &&
                        moveHistoryO[0] == index &&
                        currentPlayer == 'O');
                switch (symbol) {
                  case 'X':
                    return Center(
                      child: XWidget(
                        isOpaque: isOpaque,
                      ),
                    );
                  case 'O':
                    return const Center(
                      child: CustomOWidget(),
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
  }
}
