import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/domain/controllers/game_controller.dart';
import 'package:tictactoe/l10n/generated/l10n.dart';
import 'package:tictactoe/presentation/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameController.instance,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      routerConfig: router,
      onGenerateTitle: (_) => S.current.labelProjectName,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
