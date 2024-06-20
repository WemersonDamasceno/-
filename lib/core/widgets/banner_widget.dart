import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final Color color;
  final String label;

  const BannerWidget({super.key, required this.color, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
          topLeft: Radius.circular(100),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
