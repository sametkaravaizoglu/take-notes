import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instace = ColorManager._init();
  static ColorManager get instance {
    return _instace;
  }

  ColorManager._init();

  Color get white => const Color(0xffffffff);
  Color get gray => const Color(0xffa5a6ae);
  Color get darkGray => const Color(0xff383838);
  Color get redColor => const Color(0XFFb00020);
  Color get homeSpacer => const Color(0x0c000000);
  Color get softGray => const Color(0xff212121).withOpacity(0.6);
  Color get backgroundGray => const Color(0xFFf7f7f7);
  Color get transparent => Colors.transparent;
}
