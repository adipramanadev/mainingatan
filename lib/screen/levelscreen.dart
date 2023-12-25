import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mainingatan/core/basestate.dart';
import 'package:mainingatan/core/constant.dart';
import 'package:mainingatan/data/brain.dart';
import 'package:mainingatan/screen/gamescreen.dart';
import 'package:mainingatan/widget/mycontainers.dart';

class LevelScreen extends StatefulWidget {
  int id;
  LevelScreen({required this.id});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends BaseState<LevelScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.instance?.yellow,
      body: Padding(
        padding: EdgeInsets.all(
          Utility(context).dynamicWidthPixel(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Utility(context).dynamicWidthPixel(250),
              width: Utility(context).dynamicWidthPixel(250),
              child: Lottie.asset(
                
                'assets/rocket.json',
                repeat: true,
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ?..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            SizedBox(
              height: Utility(context).dynamicHeightPixel(20),
            ),
            Text(
              "Tingkat kesulitan Yang Anda Inginkan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Utility(context).dynamicTextSize(20),
                color: ColorManager.instance?.white,
              ),
            ),
            SizedBox(
              height: Utility(context).dynamicHeightPixel(35),
            ),
            // Tombol atau konten lainnya di sini
            GestureDetector(
              onTap: () {
                print(widget.id);
              },
              child: MyContainers(
                colours: ColorManager.instance!.blue,
                title: 'Medium',
              ),
            ),
            GestureDetector(
              onTap: () {
                print(widget.id);
              },
              child: MyContainers(
                colours: ColorManager.instance!.blue,
                title: 'Easy',
              ),
            ),
            GestureDetector(
              onTap: () {
                print(widget.id);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GameScreen(
                      Level.Easy,
                      widget.id,
                    ),
                  ),
                );
              },
              child: MyContainers(
                colours: ColorManager.instance!.blue,
                title: 'Hard',
              ),
            )
          ],
        ),
      ),
    );
  }
}
