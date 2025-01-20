import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int sum(
  int a,
  int b,
) {
  // receive two integer and return the sum
  return a + b;
}

String newCustomFunctionz(String fullName) {
  List<String> nameParts = fullName.split(' ');

  // Retorna a primeira parte da lista (o primeiro nome)
  return nameParts[0];
}

List<dynamic> newJsonItem(
  List<dynamic> jsonList,
  dynamic newJson,
) {
  // receive a list of json and a unique json, add the unique json on the list and return the new updated list
  jsonList.add(newJson);
  return jsonList;
}

DateTime addDaysToDate(
  DateTime date,
  int days,
) {
  DateTime newDate = date.add(Duration(days: days));

  return newDate;
}
