import 'dart:io';

import 'package:country_pickers/utils/utils.dart' as country_pickers;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart' as flutter_toast;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:url_launcher/url_launcher.dart' as url_launcher;

const kFontFamily = "SourceSansPro";
const kEmailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const kNamePattern = r'(^[a-zA-Z_ ]*$)';

final DateFormat serverDateTimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
final DateFormat serverDateFormat = DateFormat("yyyy-MM-dd");
final DateFormat serverTimeFormat = DateFormat("HH:mm:ss");

Future<String> tempDirectory() async {
  final directory = await path_provider.getTemporaryDirectory();
  return _checkAndCreateDir(directory);
}

Future<String> downloadDirectory() async {
  final directory = Platform.isAndroid
      ? await path_provider.getExternalStorageDirectory()
      : await path_provider.getApplicationDocumentsDirectory();
  return _checkAndCreateDir(directory!);
}

Future<String> _checkAndCreateDir(Directory directory) async {
  bool hasExisted = await directory.exists();
  if (!hasExisted) directory.create();
  return directory.path;
}

Future<bool> launchUrl(String url) async {
  var canLaunch = await url_launcher.canLaunch(url);
  if (canLaunch) {
    url_launcher.launch(url).whenComplete(() => debugPrint("launchUrl -> $url"));
  }
  return canLaunch;
}

Future<void> copyToClipboard(String value) {
  return Clipboard.setData(ClipboardData(text: value)).whenComplete(() => showToast("Copied to clipboard!"));
}

Future<void> showToast(String value) {
  return flutter_toast.Fluttertoast.showToast(
    msg: value,
    toastLength: flutter_toast.Toast.LENGTH_SHORT,
    backgroundColor: Colors.grey.shade900,
    textColor: Colors.white,
  );
}

String getFlagPathFromISOCode(String isoCode) {
  return country_pickers.CountryPickerUtils.getFlagImageAssetPath(isoCode);
}

String getFormattedCardNumber(String cardNumber, [bool padZero = true]) {
  if (cardNumber.isEmpty) return "0000  0000  0000  0000";
  var text = padZero ? cardNumber.replaceAll(" ", '').padRight(16, "0") : cardNumber;
  var buffer = StringBuffer();
  for (int i = 0; i < text.length; i++) {
    buffer.write(text[i]);
    if ((i + 1) % 4 == 0) buffer.write("  ");
  }
  return "**** **** ****" +buffer.toString().trim().substring(16);
}
String getFormattedCardNumberText(String cardNumber, [bool padZero = true]) {
  if (cardNumber.isEmpty) return "0000  0000  0000  0000";
  var text = padZero ? cardNumber.replaceAll(" ", '').padRight(16, "0") : cardNumber;
  var buffer = StringBuffer();
  for (int i = 0; i < text.length; i++) {
    buffer.write(text[i]);
    if ((i + 1) % 4 == 0) buffer.write("  ");
  }
  return buffer.toString().trim();
}

String getFormattedCardMonth(String cardMonth, [bool padZero = true]) {
  if (cardMonth.isEmpty) return "00/0000";
  var text = padZero ? cardMonth.replaceAll("/", '').padRight(6, "0") : cardMonth;
  var buffer = StringBuffer();
  for (int i = 0; i < text.length; i++) {
    buffer.write(text[i]);
    if (i == 1) buffer.write('/');
  }
  return buffer.toString().trim();
}
