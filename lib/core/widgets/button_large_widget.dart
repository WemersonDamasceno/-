import 'package:flutter/material.dart';

class ButtonLargeWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ButtonLargeWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = Size(MediaQuery.of(context).size.width * 0.8, 40);
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: size.width,
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Colors.purple,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.5),
              blurRadius: 100,
              offset: const Offset(0, 3),
            ),
          ],
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
