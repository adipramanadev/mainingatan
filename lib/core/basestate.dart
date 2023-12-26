import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicTextSize(double fontSize) =>
      dynamicWidth((fontSize / MediaQuery.of(context).size.width));

  double dynamicHeightPixel(double size) =>
      dynamicHeight((size / MediaQuery.of(context).size.height));
  double dynamicWidthPixel(double size) =>
      dynamicWidth((size / MediaQuery.of(context).size.width));
}

class Utility {
  BuildContext context;

  Utility(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  double dynamicHeight(double value) =>
      MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) =>
      MediaQuery.of(context).size.width * value;
  double dynamicTextSize(double fontSize) =>
      dynamicWidth((fontSize / MediaQuery.of(context).size.width));

  double dynamicHeightPixel(double size) =>
      dynamicHeight((size / MediaQuery.of(context).size.height));
  double dynamicWidthPixel(double size) =>
      dynamicWidth((size / MediaQuery.of(context).size.width));
}
