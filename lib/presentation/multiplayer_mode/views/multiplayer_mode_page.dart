import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/domain/controllers/multiplayer_game_controller.dart';
import 'package:tictactoe/presentation/multiplayer_mode/views/multiplayer_mode_view.dart';

class MultiPlayerModePage extends StatelessWidget {
  final bool isInsaneMode;

  const MultiPlayerModePage({super.key, required this.isInsaneMode});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MultiPlayerController>(
      create: (_) => MultiPlayerController(),
      child: MultiPlayerModeView(
        isInsaneMode: isInsaneMode,
      ),
    );
  }
}
