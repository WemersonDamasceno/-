import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/constants/app_routes.dart';
import 'package:tictactoe/presentation/choose_game_mode/views/choose_game_mode_page.dart';
import 'package:tictactoe/presentation/multiplayer_mode/views/multiplayer_mode_page.dart';
import 'package:tictactoe/presentation/splash/views/splash_page.dart';

final GoRouter router = GoRouter(
  initialLocation: "/${AppRoutes.splash}",
  routes: [
    GoRoute(
      path: "/${AppRoutes.splash}",
      name: AppRoutes.splash,
      builder: (_, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: "/${AppRoutes.multiplayer}",
      name: AppRoutes.multiplayer,
      builder: (_, state) {
        return const MultiPlayerModePage();
      },
    ),
    GoRoute(
      path: "/${AppRoutes.chooseGameMode}",
      name: AppRoutes.chooseGameMode,
      builder: (_, state) {
        return const ChooseGameModePage();
      },
    ),
  ],
);
