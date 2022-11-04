import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

int multiplicar(
  int num1f,
  int num2f,
) {
  var resultado = num1f * num2f;
  return resultado;
}

int toInteger(String valor) {
  return int.parse(valor);
}

String del(String numero) {
  if (numero.isNotEmpty) {
    return numero.substring(0, numero.length - 1);
  }
  return '';
}

bool? updateLevel(
  int level,
  int pontosLevel,
) {
  if (pontosLevel >= level * 10) {
    return true;
  } else {
    return false;
  }
}
