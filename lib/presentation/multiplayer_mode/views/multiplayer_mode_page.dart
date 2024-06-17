import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/domain/controllers/multiplayer_game_controller.dart';
import 'package:tictactoe/presentation/multiplayer_mode/views/multiplayer_mode_view.dart';

class MultiPlayerModePage extends StatelessWidget {
  const MultiPlayerModePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MultiPlayerController.instance,
      child: const MultiPlayerModeView(),
    );
  }
}
