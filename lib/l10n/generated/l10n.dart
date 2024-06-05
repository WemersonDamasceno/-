// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `MY CHALLENGES`
  String get labelChallenge {
    return Intl.message(
      'MY CHALLENGES',
      name: 'labelChallenge',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get labelClose {
    return Intl.message(
      'Close',
      name: 'labelClose',
      desc: '',
      args: [],
    );
  }

  /// `GAME MODE`
  String get labelGameMode {
    return Intl.message(
      'GAME MODE',
      name: 'labelGameMode',
      desc: '',
      args: [],
    );
  }

  /// `Lets go`
  String get labelLetsGo {
    return Intl.message(
      'Lets go',
      name: 'labelLetsGo',
      desc: '',
      args: [],
    );
  }

  /// `MULTIPLAYER`
  String get labelMultiPlayer {
    return Intl.message(
      'MULTIPLAYER',
      name: 'labelMultiPlayer',
      desc: '',
      args: [],
    );
  }

  /// `Option currently unavailable!`
  String get labelOptionIndefine {
    return Intl.message(
      'Option currently unavailable!',
      name: 'labelOptionIndefine',
      desc: '',
      args: [],
    );
  }

  /// `PLAYER {s} WINS!\nCONGRATULATIONS!`
  String labelPlayerNWinner(Object s) {
    return Intl.message(
      'PLAYER $s WINS!\nCONGRATULATIONS!',
      name: 'labelPlayerNWinner',
      desc: '',
      args: [s],
    );
  }

  /// `PLAY ONLINE`
  String get labelPlayOnline {
    return Intl.message(
      'PLAY ONLINE',
      name: 'labelPlayOnline',
      desc: '',
      args: [],
    );
  }

  /// `Tic Tac Toe Infinity`
  String get labelProjectName {
    return Intl.message(
      'Tic Tac Toe Infinity',
      name: 'labelProjectName',
      desc: '',
      args: [],
    );
  }

  /// `SCOREBOARD`
  String get labelScoreboard {
    return Intl.message(
      'SCOREBOARD',
      name: 'labelScoreboard',
      desc: '',
      args: [],
    );
  }

  /// `SINGLE PLAYER`
  String get labelSinglePlayer {
    return Intl.message(
      'SINGLE PLAYER',
      name: 'labelSinglePlayer',
      desc: '',
      args: [],
    );
  }

  /// `TRY AGAIN`
  String get labelTryAgain {
    return Intl.message(
      'TRY AGAIN',
      name: 'labelTryAgain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
