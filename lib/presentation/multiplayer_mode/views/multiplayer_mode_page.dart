import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/constants/app_sounds.dart';
import 'package:tictactoe/core/mixins/dialog_mixin.dart';
import 'package:tictactoe/core/widgets/board_widget.dart';
import 'package:tictactoe/core/widgets/card_scoreboard_widget.dart';
import 'package:tictactoe/core/widgets/title_page_widget.dart';

class MultiPlayerModePage extends StatefulWidget {
  const MultiPlayerModePage({super.key});

  @override
  State<MultiPlayerModePage> createState() => _MultiPlayerModePageState();
}

class _MultiPlayerModePageState extends State<MultiPlayerModePage>
    with DialogMixin {
  List<String> board = List.generate(9, (index) => '');
  List<int> moveHistoryX = [];
  List<int> moveHistoryO = [];
  String currentPlayer = 'X';
  String winner = '';

  int qtdWinsPlayer1 = 0;
  int qtdWinsPlayer2 = 0;

  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();

    player.setVolume(1);
  }

  Future<void> _handleTap(int index) async {
    if (board[index] == '' && winner == '') {
      await player.stop();
      await player.play(AssetSource(AppSounds.click1));

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
          player.play(AssetSource(AppSounds.win));
          winner = currentPlayer;

          showDialogEndGame(context, winner == "X" ? 1 : 2, resetGame);

          if (winner == 'X') {
            qtdWinsPlayer1++;
          } else {
            qtdWinsPlayer2++;
          }
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

  void resetGame() {
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
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => resetGame(),
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitlePageWidget(
              label: "PLACAR",
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardScoreboardWidget(
                  color: AppColors.secondary,
                  player: 'Player 1',
                  score: qtdWinsPlayer1,
                  image: AppImages.x,
                ),
                CardScoreboardWidget(
                  color: AppColors.primary,
                  player: 'Player 2',
                  score: qtdWinsPlayer2,
                  image: AppImages.o,
                ),
              ],
            ),
            const SizedBox(height: 16),
            BoardWidget(
              board: board,
              moveHistoryX: moveHistoryX,
              moveHistoryO: moveHistoryO,
              currentPlayer: currentPlayer,
              handleTap: (value) => _handleTap(value),
            ),
          ],
        ),
      ),
    );
  }
}
