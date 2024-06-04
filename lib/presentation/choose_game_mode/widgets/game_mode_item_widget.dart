import 'package:flutter/material.dart';

class GameModeItemWidget extends StatelessWidget {
  final String label;
  final String image;
  final bool isEnable;
  final VoidCallback onTap;

  const GameModeItemWidget({
    super.key,
    required this.label,
    required this.image,
    this.isEnable = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            color: isEnable ? Colors.white : Colors.grey[500],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                width: 120,
                height: 120,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: isEnable ? Colors.white : Colors.grey[500],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
