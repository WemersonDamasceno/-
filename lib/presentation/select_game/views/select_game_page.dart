import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/widgets/app_bar_widget.dart';
import 'package:tictactoe/presentation/insane_game_mode/views/insane_game_mode_page.dart';
import 'package:tictactoe/presentation/normal_game_mode/views/normal_game_mode_page.dart';
import 'package:tictactoe/presentation/select_game/widgets/tab_bar_widget.dart';

class SelectGamePage extends StatefulWidget {
  const SelectGamePage({super.key});

  @override
  State<SelectGamePage> createState() => _SelectGamePageState();
}

class _SelectGamePageState extends State<SelectGamePage> {
  final tabs = [
    const Tab(
      key: ValueKey('tab-widget-01'),
      text: "NORMAL GAME",
    ),
    const Tab(
      key: ValueKey('tab-widget-02'),
      text: "INSANE GAME",
    ),
  ];

  final List<Widget> views = [
    const NormalGameModePage(
      key: ValueKey('view-widget-02'),
    ),
    const InsaneGameModePage(
      key: ValueKey('view-widget-03'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: TabBarWidget(
        tabs: tabs,
        views: views,
      ),
    );
  }
}
