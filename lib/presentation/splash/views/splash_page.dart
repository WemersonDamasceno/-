import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tictactoe/core/constants/app_colors.dart';
import 'package:tictactoe/core/constants/app_images.dart';
import 'package:tictactoe/core/constants/app_routes.dart';
import 'package:tictactoe/core/constants/app_sounds.dart';
import 'package:tictactoe/core/widgets/background_gradient_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer()..play(AssetSource(AppSounds.splash));
    player.setVolume(0.7);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward().whenComplete(
        () => GoRouter.of(context).pushReplacementNamed(
          AppRoutes.chooseGameMode,
        ),
      );
  }

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
            BackgroundGradientWidget(
              child: LottieBuilder.asset(
                AppImages.splashAnimation,
                controller: animationController,
                width: size.width,
                height: size.height * 0.4,
                repeat: false,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppImages.object1,
              ),
            ),
            SizedBox(
              width: size.width * 0.8,
              height: 15,
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    value: animationController.value,
                    backgroundColor: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(100),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.secondary,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                AppImages.object2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
