import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/widgets/card_scoreboard_widget.dart';
import 'package:tictactoe/core/widgets/title_page_widget.dart';

class MultiPlayerModePage extends StatefulWidget {
  const MultiPlayerModePage({super.key});

  @override
  State<MultiPlayerModePage> createState() => _MultiPlayerModePageState();
}

class _MultiPlayerModePageState extends State<MultiPlayerModePage> {
  List<String> board = List.generate(9, (index) => '');
  List<int> moveHistoryX = [];
  List<int> moveHistoryO = [];
  String currentPlayer = 'X';
  String winner = '';

  void _handleTap(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = currentPlayer;

        List<int> currentHistory =
            currentPlayer == 'X' ? moveHistoryX : moveHistoryO;
        currentHistory.add(index);

        if (currentHistory.length > 3) {
          int removeIndex = currentHistory.removeAt(0);
          board[removeIndex] = '';
        }

        if (_checkWinner(currentPlayer)) {
          winner = currentPlayer;
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWinner(String player) {
    const List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void _resetGame() {
    setState(() {
      board = List.generate(9, (index) => '');
      moveHistoryX.clear();
      moveHistoryO.clear();
      currentPlayer = 'X';
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight),
            const TitlePageWidget(
              label: "PLACAR",
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardScoreboardWidget(
                  color: AppColors.secondary,
                  player: 'Player 1',
                  score: 2,
                  image: AppImages.x,
                ),
                CardScoreboardWidget(
                  color: AppColors.primary,
                  player: 'Player 2',
                  score: 1,
                  image: AppImages.o,
                ),
              ],
            ),
            _buildBoard(),
            const SizedBox(height: 16),
            if (winner.isNotEmpty) _buildWinnerMessage(),
            const SizedBox(height: 16),
            _buildResetButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBoard() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _handleTap(index),
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

  Widget _buildWinnerMessage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        '$winner é o vencedor!',
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildResetButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _resetGame,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: const Text(
          'Reset Game',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class XWidget extends StatelessWidget {
  final bool isOpaque;

  const XWidget({
    super.key,
    required this.isOpaque,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      size: 80,
      color: isOpaque ? const Color.fromARGB(164, 168, 64, 57) : Colors.red,
    );
  }
}

class CustomOWidget extends StatelessWidget {
  const CustomOWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      size: Size(48, 48),
      painter: OPainter(dashCount: 8),
    );
  }
}

class OPainter extends CustomPainter {
  final int dashCount;

  const OPainter({required this.dashCount});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    // Desenha o círculo com traços interrompidos
    Path path = Path();
    double sweepAngle = (2 * 3.14) / dashCount;
    for (int i = 0; i < dashCount; i++) {
      double startAngle = i * sweepAngle;
      path.addArc(Rect.fromCircle(center: center, radius: radius), startAngle,
          sweepAngle / 2);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
