import 'package:flutter/material.dart';
import 'package:mainingatan/core/basestate.dart';
import 'package:mainingatan/core/navigation_constant.dart';
import 'package:mainingatan/core/navigation_manager.dart';

import 'package:mainingatan/core/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    Future.delayed(
      Duration(milliseconds: 1500),
      () async {
        NavigationService.instance
            .navigateToPageClear(NavigationConstants.CATEGORIES, {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.instance!.yellow,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          height: dynamicHeight(0.90),
          width: dynamicWidth(0.90),
        ),
      ),
    );
  }
}
