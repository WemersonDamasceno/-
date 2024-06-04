import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_colors.dart';

class ButtonLargeWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double width;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  const ButtonLargeWidget._({
    super.key,
    required this.label,
    required this.width,
    required this.onPressed,
    this.backgroundColor,
    this.border,
    this.boxShadow,
  });

  factory ButtonLargeWidget.outline({
    Key? key,
    required String label,
    required VoidCallback onPressed,
  }) =>
      ButtonLargeWidget._(
        key: key,
        width: 0.8,
        label: label,
        onPressed: onPressed,
        border: Border.all(
          color: Colors.purple,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.5),
            blurRadius: 100,
            offset: const Offset(0, 3),
          )
        ],
      );

  factory ButtonLargeWidget.fill({
    Key? key,
    required String label,
    required VoidCallback onPressed,
  }) =>
      ButtonLargeWidget._(
        key: key,
        width: 0.8,
        label: label,
        onPressed: onPressed,
        backgroundColor: AppColors.buttonBackground,
      );

  @override
  Widget build(BuildContext context) {
    final size = Size(MediaQuery.of(context).size.width * width, 40);
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: size.width,
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: border,
          boxShadow: boxShadow,
          color: backgroundColor,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
