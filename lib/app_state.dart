import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _nome = prefs.getString('ff_nome') ?? _nome;
    _pontosTotais = prefs.getInt('ff_pontosTotais') ?? _pontosTotais;
    _pontosLevel = prefs.getInt('ff_pontosLevel') ?? _pontosLevel;
    _level = prefs.getInt('ff_level') ?? _level;
    _record2 = prefs.getInt('ff_record2') ?? _record2;
    _record3 = prefs.getInt('ff_record3') ?? _record3;
    _record1 = prefs.getInt('ff_record1') ?? _record1;
    _record4 = prefs.getInt('ff_record4') ?? _record4;
    _Tema = prefs.getInt('ff_Tema') ?? _Tema;
  }

  late SharedPreferences prefs;

  int num1 = 0;

  int num2 = 0;

  int result = 0;

  int pontosPartida = 0;

  String resultadoDigitado = '';

  int timer = 0;

  String _nome = '';
  String get nome => _nome;
  set nome(String _value) {
    _nome = _value;
    prefs.setString('ff_nome', _value);
  }

  int _pontosTotais = 0;
  int get pontosTotais => _pontosTotais;
  set pontosTotais(int _value) {
    _pontosTotais = _value;
    prefs.setInt('ff_pontosTotais', _value);
  }

  int _pontosLevel = 0;
  int get pontosLevel => _pontosLevel;
  set pontosLevel(int _value) {
    _pontosLevel = _value;
    prefs.setInt('ff_pontosLevel', _value);
  }

  int _level = 0;
  int get level => _level;
  set level(int _value) {
    _level = _value;
    prefs.setInt('ff_level', _value);
  }

  int tipo = 0;

  String num1Digitado = '';

  String num2Digitado = '';

  int certo = 0;

  int _record2 = 0;
  int get record2 => _record2;
  set record2(int _value) {
    _record2 = _value;
    prefs.setInt('ff_record2', _value);
  }

  int _record3 = 0;
  int get record3 => _record3;
  set record3(int _value) {
    _record3 = _value;
    prefs.setInt('ff_record3', _value);
  }

  int _record1 = 0;
  int get record1 => _record1;
  set record1(int _value) {
    _record1 = _value;
    prefs.setInt('ff_record1', _value);
  }

  int _record4 = 0;
  int get record4 => _record4;
  set record4(int _value) {
    _record4 = _value;
    prefs.setInt('ff_record4', _value);
  }

  int _Tema = 0;
  int get Tema => _Tema;
  set Tema(int _value) {
    _Tema = _value;
    prefs.setInt('ff_Tema', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
