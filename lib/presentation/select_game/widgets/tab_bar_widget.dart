import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';

class TabBarWidget extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> views;

  const TabBarWidget({
    super.key,
    required this.tabs,
    required this.views,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 18),
          Material(
            color: AppColors.background,
            child: TabBar(
              tabs: widget.tabs,
              controller: _tabController,
              labelColor: Colors.white,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.tab,
              automaticIndicatorColorAdjustment: false,
              unselectedLabelColor: Colors.grey[400]!,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.views,
            ),
          ),
        ],
      ),
    );
  }
}
