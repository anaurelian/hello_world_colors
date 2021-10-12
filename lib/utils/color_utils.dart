import 'dart:ui';

import 'package:flutter/material.dart';

class ColorUtils {
  /// Converts a Color value into a hexadecimal color string.
  static String toHex(Color color) => '#${(color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

  static Color contrastColor(Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black;

}
