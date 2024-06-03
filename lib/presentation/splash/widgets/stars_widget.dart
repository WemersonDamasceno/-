import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_images.dart';

class StarsWidget extends StatelessWidget {
  final bool isLeft;

  const StarsWidget({super.key, required this.isLeft});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.star,
          width: 35,
          height: 35,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: isLeft ? 0 : 60,
            right: isLeft ? 60 : 0,
          ),
          child: Image.asset(
            AppImages.star,
            width: 35,
            height: 35,
          ),
        ),
      ],
    );
  }
}
