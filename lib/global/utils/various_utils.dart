import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:p2p_car_renting/global/dio/dio_client.dart';
import 'package:p2p_car_renting/global/utils/logger.dart';

String addCommasToNumber(String number) {
  return number.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (match) => '${match[1]},',
  );
}

void setStatusBarColorLight({Color? statusBarColor}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

void setStatusBarColorDark({Color? statusBarColor}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

void setStatusBarColor(
  Color statusBarColor, {
  Brightness? brightness,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: brightness,
    ),
  );
}

Future<void> switchStatusBarColor(
  BuildContext context, {
  required AsyncCallback callback,
}) async {
  setStatusBarColor(Colors.transparent, brightness: Brightness.light);
  await callback();
  setStatusBarColor(Colors.transparent, brightness: Brightness.dark);
}

Future<void> popAndSwitchStatusBarColor(
  BuildContext context, {
  required AsyncCallback callback,
}) async {
  context.popRoute();
  setStatusBarColor(Colors.transparent, brightness: Brightness.light);
  await callback();
  setStatusBarColor(Colors.transparent, brightness: Brightness.dark);
}

String convertBoolToOnOff(BuildContext context, {required bool value}) {
  return value ? 'on' : 'off';
}

Future<bool> checkInternetStatus({
  Duration duration = const Duration(seconds: 2),
}) async {
  try {
    final url = Uri.parse(baseUrl);
    final response = await http.head(url).timeout(duration);
    if (response.statusCode == 200) {
      logger.w('Internet is found');
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

String formatDateTime(
  DateTime date, {
  String pattern = 'yyyy-MM-dd',
  String? locale,
}) {
  return DateFormat(pattern, locale).format(date);
}

String getAbbreviatedMonth(DateTime date, {String? locale}) {
  return DateFormat('MMM', locale).format(date);
}

String getAbbreviatedDay(DateTime date, {String? locale}) {
  return DateFormat('E', locale).format(date);
}

String getDayNumInMonth(DateTime date, {String? locale}) {
  return DateFormat('dd', locale).format(date);
}

void triggerHaptics() {
  HapticFeedback.mediumImpact();
}

String generateRandomString(int length) {
  const letters = 'abcdefghijklmnopqrstuvwxyz';
  const lettersWithNumbers = 'a0b1c2d3e4f5g6h7i8j9k0lmnopqrstuvwxyz';
  final random = Random();

  // Choose a random letter as the starting character
  final firstChar = letters[random.nextInt(letters.length)];

  // Generate the remaining characters randomly
  final String randomString = firstChar +
      List.generate(length - 1, (index) {
        return lettersWithNumbers[random.nextInt(lettersWithNumbers.length)];
      }).join();

  return randomString;
}

dynamic getValue(Map<String, dynamic> value) {
  return value.values.first;
}
