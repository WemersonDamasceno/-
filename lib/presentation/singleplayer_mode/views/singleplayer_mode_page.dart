import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/domain/controllers/singleplayer_game_controller.dart';
import 'package:tictactoe/presentation/singleplayer_mode/views/singleplayer_mode_view.dart';

class SinglePlayerModePage extends StatelessWidget {
  final bool isInsaneMode;

  const SinglePlayerModePage({super.key, required this.isInsaneMode});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SinglePlayerController>(
      create: (_) => SinglePlayerController(),
      child: SinglePlayerModeView(
        isInsaneMode: isInsaneMode,
      ),
    );
  }
}
