import 'dart:ui';

import 'package:hello_world_colors/utils/color_utils.dart';

class UIStrings {
  // -----------------------------------------------------------------------------------------------
  // App
  // -----------------------------------------------------------------------------------------------

  static const String appName = 'Hello World Colors';

  static const String colorTypeFilter = 'Color Type';
  static const String luminosityFilter = 'Luminosity';

  static String copyAction(Color color) => 'Copy ${ColorUtils.toHex(color)}';
  static const String settingsAction = 'Settings';
  static const String rateAction = 'Rate app';
  static const String whatAction = 'What is this app?';


  static const String settingsScreen = 'Settings';
  static const String animateBlobSetting = 'Animate blob';


}