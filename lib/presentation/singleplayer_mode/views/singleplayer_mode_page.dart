import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/domain/controllers/singleplayer_game_controller.dart';
import 'package:tictactoe/presentation/singleplayer_mode/views/singleplayer_mode_view.dart';

class SinglePlayerModePage extends StatelessWidget {
  const SinglePlayerModePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SinglePlayerController.instance,
      child: const SinglePlayerModeView(),
    );
  }
}
