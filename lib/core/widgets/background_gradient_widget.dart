import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';

class BackgroundGradientWidget extends StatelessWidget {
  final Widget child;

  const BackgroundGradientWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.primary.withOpacity(0.5),
            AppColors.secondary.withOpacity(0.5),
          ],
        ),
      ),
      child: child,
    );
  }
}
