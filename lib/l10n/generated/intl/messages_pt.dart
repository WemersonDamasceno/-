// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(s) => "Jogador ${s}";

  static String m1(s) => "Jogador ${s} Venceu!\nParabéns!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "labelAttention": MessageLookupByLibrary.simpleMessage("Atenção!"),
        "labelAttentionDescription": MessageLookupByLibrary.simpleMessage(
            "Quando uma peça fica desfocada, significa que ela será movida para uma nova posição."),
        "labelChallenge": MessageLookupByLibrary.simpleMessage("MEUS DESAFIOS"),
        "labelClose": MessageLookupByLibrary.simpleMessage("Fechar"),
        "labelCommingSoon": MessageLookupByLibrary.simpleMessage("EM BREVE"),
        "labelComputer": MessageLookupByLibrary.simpleMessage("Computador"),
        "labelDrawDescription": MessageLookupByLibrary.simpleMessage(
            "QUE INCRÍVEL!\nO JOGO TERMINOU EMPATADO!"),
        "labelDrawTitle": MessageLookupByLibrary.simpleMessage("EMPATADOS"),
        "labelGameMode": MessageLookupByLibrary.simpleMessage("MODO DE JOGO"),
        "labelInsaneMode": MessageLookupByLibrary.simpleMessage("INSANE GAME"),
        "labelLetsGo": MessageLookupByLibrary.simpleMessage("Vamos lá"),
        "labelMultiPlayer":
            MessageLookupByLibrary.simpleMessage("DOIS JOGADORES"),
        "labelMultiPlayerShowCase":
            MessageLookupByLibrary.simpleMessage("Modo multiplayer"),
        "labelMultiPlayerShowCaseDescription":
            MessageLookupByLibrary.simpleMessage(
                "Desafie um amigo em partidas no mesmo dispositivo."),
        "labelNormalMode": MessageLookupByLibrary.simpleMessage("NORMAL GAME"),
        "labelOptionIndefine": MessageLookupByLibrary.simpleMessage(
            "Opção indisponível no momento!"),
        "labelPlayOnline": MessageLookupByLibrary.simpleMessage("JOGUE ONLINE"),
        "labelPlayer": m0,
        "labelPlayerNWinner": m1,
        "labelProjectName":
            MessageLookupByLibrary.simpleMessage("Jogo da Velha Infinito"),
        "labelScoreboard": MessageLookupByLibrary.simpleMessage("PLACAR"),
        "labelScoreboardShowCase":
            MessageLookupByLibrary.simpleMessage("Placar do Jogo"),
        "labelScoreboardShowCaseDescription":
            MessageLookupByLibrary.simpleMessage(
                "Acompanhe a pontuação de cada jogador aqui."),
        "labelSinglePlayer": MessageLookupByLibrary.simpleMessage("UM JOGADOR"),
        "labelTryAgain":
            MessageLookupByLibrary.simpleMessage("TENTAR NOVAMENTE"),
        "labelYouLose":
            MessageLookupByLibrary.simpleMessage("Que Pena, Você Perdeu!")
      };
}
