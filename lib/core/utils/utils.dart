import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<R?> errorHandler<R>({required Future<R?> Function() tryMethod, required Function(dynamic exception) onErr}) async {
  try {
    return await tryMethod();
  } catch (exception) {
    debugPrint(exception.toString());
    return await onErr(exception);
  }
}

class Utils {
  static double get extraLowTextSize => Get.height * 0.012;
  static double get lowTextSize => Get.height * 0.015;
  static double get normalTextSize => Get.height * 0.018;
  static double get highTextSize => Get.height * 0.022;
  static double get extraHighTextSize => Get.height * 0.025;

  static double get extraLowPadding => Get.height * 0.005;
  static double get lowPadding => Get.height * 0.01;
  static double get normalPadding => Get.height * 0.015;
  static double get highPadding => Get.height * 0.02;
  static double get extraHighPadding => Get.height * 0.025;

  //Radius
  static double get extraLowRadius => Get.height * 0.01;
  static double get lowRadius => Get.height * 0.015;
  static double get normalRadius => Get.height * 0.02;
  static double get highRadius => Get.height * 0.025;
  static double get extraHighRadius => Get.height * 0.035;

  //Icons
  static double get extraLowIconSize => Get.height * 0.015;
  static double get lowIconSize => Get.height * 0.02;
  static double get normalIconSize => Get.height * 0.025;
  static double get highIconSize => Get.height * 0.033;
  static double get extraHighIconSize => Get.height * 0.04;

  static double get appBarHeight => Get.height * 0.08;
  static double get bottomBarHeight => Get.height * 0.065;
  static RegExp regexEmoji = RegExp(r'(\u00a9|\u00ae|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

  static Duration get animationDuration => const Duration(milliseconds: 300);
}

extension CustomDateTimeExtensions on DateTime {
  int differanceWithTimeOfDayInMinutes(TimeOfDay timeOfDay) {
    return (hour - timeOfDay.hour) * 60 + (minute - timeOfDay.minute);
  }

  int daysBetween(DateTime to) {
    DateTime from = DateTime(year, month, day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }
}

extension CustomBoolExtension on bool {
  int get toInt => this ? 1 : 0;
}

extension CustomNumExtension on num {
  num addIfNotNull(num? value) => value != null ? this + value : this;
}

extension CustomIntExtension on int {
  bool get integerToBoolZeroAndOneControl {
    return this == 1 ? true : false;
  }
}

extension CustomStringExtensions on String {
  Color toColor() {
    final hexCode = replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  Color? toColorNullable() {
    try {
      final hexCode = replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    } catch (_) {
      return null;
    }
  }

  DateTime? getBackendDateToDateTime() {
    return DateTime.tryParse(this)?.add(const Duration(hours: 3, minutes: 0, microseconds: 0, milliseconds: 0));
  }

  String get getFirstLetter {
    if (isEmpty) return "";
    return this[0];
  }

  bool containsWithTurkishChars(String key) {
    return replaceTurkishChars.contains(key.replaceTurkishChars);
  }

  String get replaceTurkishChars {
    var replaced = toLowerCase();
    replaced = replaced.replaceAll('ş', 's');
    replaced = replaced.replaceAll('ı', 'i');
    replaced = replaced.replaceAll('ğ', 'g');
    replaced = replaced.replaceAll('ç', 'c');
    replaced = replaced.replaceAll('ö', 'o');
    replaced = replaced.replaceAll('ü', 'u');
    return replaced;
  }

  String checkSubstring(int start, int end) {
    if (length < end) {
      return this;
    }
    return substring(start, end);
  }

  bool get isValidEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-\=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  String lastChars(int n) {
    if (length < n) return "";
    return substring(length - n);
  }
}
