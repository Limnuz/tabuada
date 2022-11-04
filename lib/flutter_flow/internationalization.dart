import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.toString());

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    'ac9feb7v': {
      'pt': 'Level: ',
      'en': 'Level:',
    },
    '0mnzcorz': {
      'pt': 'Level Up: ',
      'en': 'Level Up:',
    },
    'cqtzwk48': {
      'pt': 'Pontos: ',
      'en': 'Points:',
    },
    'jbt8k3eq': {
      'pt': 'Jogo 1',
      'en': 'game 1',
    },
    'cjrlpeo4': {
      'pt': 'Record: ',
      'en': 'Record:',
    },
    'coxdvkar': {
      'pt': ' Pts',
      'en': 'pts',
    },
    'pxbj6au5': {
      'pt': 'Jogo 2',
      'en': 'game 2',
    },
    '093dkkd4': {
      'pt': 'Record: ',
      'en': 'Record:',
    },
    '86zbocqu': {
      'pt': ' Pts',
      'en': 'pts',
    },
    'gp93295s': {
      'pt': 'Jogo 3',
      'en': 'game 3',
    },
    'wnbq6u5k': {
      'pt': 'Record: ',
      'en': 'Record:',
    },
    '6tg92fi2': {
      'pt': ' Pts',
      'en': 'pts',
    },
    'rcb946af': {
      'pt': 'Jogo 4',
      'en': 'game 4',
    },
    '9ud482z7': {
      'pt': 'Record: ',
      'en': 'Record:',
    },
    'w761p187': {
      'pt': ' Pts',
      'en': 'pts',
    },
    '3vjdiose': {
      'pt': 'Tabuada Game',
      'en': 'Multiplication Table',
    },
    'tl0iy29v': {
      'pt': 'Meus Aplicativos',
      'en': 'My Apps',
    },
    'kzxy731x': {
      'pt': 'Sobre',
      'en': 'About',
    },
    'a3etfpbe': {
      'pt': 'Tema:',
      'en': 'Theme:',
    },
    '6z6h5l9n': {
      'pt': 'Sistema',
      'en': 'System',
    },
    'ab4umnu2': {
      'pt': 'Claro',
      'en': 'clear',
    },
    '08xzjl7n': {
      'pt': 'Escuro',
      'en': 'Dark',
    },
    'aypd13wu': {
      'pt': 'Home',
      'en': 'home',
    },
  },
  // game1
  {
    '1c5pe36o': {
      'pt': 'x',
      'en': 'x',
    },
    '607y0cgr': {
      'pt': '=',
      'en': '=',
    },
    'e741aig9': {
      'pt': '1',
      'en': '1',
    },
    'kzqumhv7': {
      'pt': '2',
      'en': '2',
    },
    'rs1rlqqb': {
      'pt': '3',
      'en': '3',
    },
    '7de8x4aw': {
      'pt': '4',
      'en': '4',
    },
    'jm4ne9h3': {
      'pt': '5',
      'en': '5',
    },
    'w8oq1o5g': {
      'pt': '6',
      'en': '6',
    },
    'qr9v4byq': {
      'pt': '7',
      'en': '7',
    },
    'vdjp7mhd': {
      'pt': '8',
      'en': '8',
    },
    'ojv7hy8u': {
      'pt': '9',
      'en': '9',
    },
    'h4nttudl': {
      'pt': '<',
      'en': '&lt;',
    },
    'rreyojos': {
      'pt': '0',
      'en': '0',
    },
    'ggqs0mk0': {
      'pt': '=',
      'en': '=',
    },
    'zblp1fzo': {
      'pt': 'Tabuada Game',
      'en': 'Multiplication Table',
    },
    '9pg1lz21': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // myApps
  {
    'zjcab52s': {
      'pt': 'Lista de Compras',
      'en': 'Shopping List',
    },
    '756z06fy': {
      'pt': 'Calendário offline',
      'en': 'Offline calendar',
    },
    'mg80felx': {
      'pt': 'Tabuada Games',
      'en': 'Multiplication Tables',
    },
    'v8148g8b': {
      'pt': 'Calculadora Bhaskara',
      'en': 'Bhaskara Calculator',
    },
    'z86s5r6n': {
      'pt': 'Meus Aplicativos',
      'en': 'My Apps',
    },
    'a0ddr1ch': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // sobre
  {
    'hmaxvi5w': {
      'pt': 'Olá, feliz em ver você!',
      'en': 'Hello, happy to see you!',
    },
    'ixu7pocl': {
      'pt': 'Versão 2.0.1',
      'en': 'Version 2.0.1',
    },
    '5q54nf2k': {
      'pt': 'Avalie na Play Store',
      'en': 'Rate it on the Play Store',
    },
    'rmq1txnq': {
      'pt': 'Compartilhe o App',
      'en': 'Share the App',
    },
    '2m1ddayc': {
      'pt': 'Sobre',
      'en': 'About',
    },
    'p2b8mv4k': {
      'pt': 'Home',
      'en': 'home',
    },
  },
  // game2
  {
    '0xr91l04': {
      'pt': 'x',
      'en': '',
    },
    'nfstzjk7': {
      'pt': '=',
      'en': '',
    },
    '5hyejd3z': {
      'pt': '1',
      'en': '',
    },
    'xu9ddjtc': {
      'pt': '2',
      'en': '',
    },
    '1ubnrho8': {
      'pt': '3',
      'en': '3',
    },
    'kwr2jwnt': {
      'pt': '4',
      'en': '4',
    },
    '1ktftuw9': {
      'pt': '5',
      'en': '5',
    },
    'l8tcvfhz': {
      'pt': '6',
      'en': '6',
    },
    'vqmd6r2c': {
      'pt': '7',
      'en': '7',
    },
    'gexbsuwb': {
      'pt': '8',
      'en': '8',
    },
    'gmphnw8e': {
      'pt': '9',
      'en': '9',
    },
    'bydtgeqx': {
      'pt': '<',
      'en': '&lt;',
    },
    'qoh5hh08': {
      'pt': '0',
      'en': '0',
    },
    '0ls86ej9': {
      'pt': '=',
      'en': '=',
    },
    'qotghys2': {
      'pt': 'Tabuada Game',
      'en': 'Multiplication Table',
    },
    'mvz6a9ho': {
      'pt': 'Home',
      'en': 'home',
    },
  },
  // levelUp
  {
    'ip2q2klr': {
      'pt': 'Parabéns, você subiu de Nível',
      'en': 'Congratulations, you&#39;ve leveled up',
    },
    'tpo6arud': {
      'pt': 'Ótimo!',
      'en': 'Excellent!',
    },
    'wdan0hy1': {
      'pt': 'Level Up',
      'en': 'Level Up',
    },
    'jmsaik2h': {
      'pt': 'Home',
      'en': 'home',
    },
  },
].reduce((a, b) => a..addAll(b));
