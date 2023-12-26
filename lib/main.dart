import 'package:flutter/material.dart';
import 'package:mainingatan/core/navigation_manager.dart';
import 'package:mainingatan/core/navigation_root.dart';

import 'screen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Educational Memory Game',
      theme: ThemeData(
        primaryColor: const Color(0xffD35B07),
        scaffoldBackgroundColor: const Color(0xffD35B07),
        fontFamily: "MilkyNice-Clean",
      ),
      home: const SplashScreen(),
    );
  }
}
