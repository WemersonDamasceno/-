import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardScoreboardWidget extends StatelessWidget {
  final Color color;
  final String player;
  final int score;
  final String image;

  const CardScoreboardWidget({
    super.key,
    required this.color,
    required this.player,
    required this.score,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Card(
            child: SizedBox(
              width: 90,
              height: 90,
              child: FittedBox(
                child: Center(
                  child: Text(
                    score.toString(),
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              player,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.black,
              height: 2,
            ),
          ),
          const SizedBox(height: 10),
          FittedBox(
            child: SvgPicture.asset(
              image,
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
