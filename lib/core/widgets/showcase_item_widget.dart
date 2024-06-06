import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';

class ShowcaseItemWidget extends StatelessWidget {
  final GlobalKey globalKeyShowcase;
  final Widget widget;
  final bool isEnableToShowcase;
  final String title;
  final String description;

  const ShowcaseItemWidget({
    super.key,
    required this.globalKeyShowcase,
    required this.widget,
    required this.isEnableToShowcase,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isEnableToShowcase,
      replacement: widget,
      child: Showcase(
        key: globalKeyShowcase,
        title: S.current.labelAttention,
        description: S.current.labelAttentionDescription,
        child: widget,
      ),
    );
  }
}
