import 'package:flutter/material.dart';
import 'package:mainingatan/data/categorimockdata.dart';
import 'package:mainingatan/screen/categoriespage.dart';
import 'package:mainingatan/screen/levelscreen.dart';

import 'navigation_constant.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LEVEL_SCREEN:
        return MaterialPageRoute(
          builder: (context) => LevelScreen(
            id: texts[0]["id"],
          ),
        );
      case NavigationConstants.CATEGORIES:
        return MaterialPageRoute(
          builder: (context) => CategoriesPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => LevelScreen(
            id: texts[0]["id"],
          ),
        );
    }
  }
}
