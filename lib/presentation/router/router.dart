import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/constants/app_routes.dart';
import 'package:tictactoe/presentation/multiplayer_mode/views/multiplayer_mode_page.dart';
import 'package:tictactoe/presentation/my_challengers/views/my_challengers_page.dart';
import 'package:tictactoe/presentation/select_game/views/select_game_page.dart';
import 'package:tictactoe/presentation/singleplayer_mode/views/singleplayer_mode_page.dart';
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
      path: "/${AppRoutes.chooseGameMode}",
      name: AppRoutes.chooseGameMode,
      builder: (_, state) {
        return const SelectGamePage();
      },
    ),
    // GoRoute(
    //   path: "/${AppRoutes.chooseGameMode}",
    //   name: AppRoutes.chooseGameMode,
    //   builder: (_, state) {
    //     return const ChooseGameModePage();
    //   },
    // ),
    GoRoute(
      path: "/${AppRoutes.singlePlayer}",
      name: AppRoutes.singlePlayer,
      builder: (_, state) {
        final isInsaneMode = state.extra as bool;

        return SinglePlayerModePage(
          isInsaneMode: isInsaneMode,
        );
      },
    ),
    GoRoute(
      path: "/${AppRoutes.multiplayer}",
      name: AppRoutes.multiplayer,
      builder: (_, state) {
        final isInsaneMode = state.extra as bool;
        return MultiPlayerModePage(
          isInsaneMode: isInsaneMode,
        );
      },
    ),
    GoRoute(
      path: "/${AppRoutes.challenge}",
      name: AppRoutes.challenge,
      builder: (_, state) {
        return const MyChallengersPage();
      },
    ),
  ],
);
