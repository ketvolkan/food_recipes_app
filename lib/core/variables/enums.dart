// Bayraklar

import 'package:food_recipes_app/core/constants/app_constants.dart';

enum ArgumentEnum {
  common;
}

enum Flags {
  tr,
  en;

  String get getFlag => AppConstants.flagPath(flagName: name);
}
