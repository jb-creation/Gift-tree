import 'dart:typed_data';

import 'package:pessa_flow/extensions/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/type.dart';

part 'bank.dart';

part 'chat.dart';

part 'common_resp.dart';

part 'contact.dart';

part 'login_model.dart';

part 'model.g.dart';

part 'notification.dart';

part 'transaction.dart';

double parseDoubleFromString(String? value) {
  return value.toDouble();
}

int parseIntFromString(String? value) {
  return value.toInt();
}

String valueToString(value) => value.toString();
