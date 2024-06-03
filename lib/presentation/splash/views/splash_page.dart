import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/presentation/splash/widgets/stars_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: kToolbarHeight),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const StarsWidget(isLeft: false),
                  SizedBox(
                    width: size.width * 0.5,
                    child: const Text(
                      'Jogo da Velha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const StarsWidget(isLeft: true),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Image.asset(
                  AppImages.star,
                  width: 55,
                  height: 55,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Image.asset(
              AppImages.object1,
            ),
            const SizedBox(height: 32),
            SvgPicture.asset(
              AppImages.object2,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
