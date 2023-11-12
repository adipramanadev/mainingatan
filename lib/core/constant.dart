import 'package:flutter/material.dart';

class ColorManager {
  static ColorManager? _instance;
  static ColorManager? get instance {
    if (_instance == null) _instance = ColorManager._init();
    return _instance;
  }

  ColorManager._init();
  Color get green => const Color(0xff38c172);
  Color get red => const Color(0xffe3342f);
  Color get blue => const Color(0xff3490dc);
  Color get white => const Color(0xffffffff);
  Color get orange => const Color(0xffD35B07);
  Color get yellow => const Color(0xffffc200);
  Color get grey => const Color(0xff4D4D4D);
  Color get greyText => const Color(0xFF231F20);
  Color get darkBlue => const Color(0xff102956);
}
