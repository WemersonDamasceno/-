import 'package:flutter/material.dart';

class GameModeItemWidget extends StatelessWidget {
  final String label;
  final String image;
  final bool isEnable;
  final VoidCallback? onTap;
  final Widget? banner;

  const GameModeItemWidget({
    super.key,
    required this.label,
    required this.image,
    this.isEnable = true,
    this.onTap,
    this.banner,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                color: isEnable ? Colors.white : Colors.grey[500],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image.asset(
                        image,
                        width: size.width * 0.32,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FittedBox(
                child: SizedBox(
                  width: size.width * 0.35,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isEnable ? Colors.white : Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (banner != null)
            Positioned(
              bottom: 50,
              right: 3,
              child: banner!,
            ),
        ],
      ),
    );
  }
}
