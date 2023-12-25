import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mainingatan/core/basestate.dart';
import 'package:mainingatan/core/constant.dart';
import 'package:mainingatan/data/brain.dart';

class GameScreen extends StatefulWidget {
  final Level _level;
  final int id;
  GameScreen(this._level, this.id);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends BaseState<GameScreen> {
  late Level _level;
  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  bool _wait = false;
  late Timer _timer;
  int _time = 2;
  late int _left;
  late bool _isFinished;
  late List<String> _data;
  late List<bool> _cards;
  late List<GlobalKey<FlipCardState>> _cardState;

  //Criar cards
  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: Offset(0.1, 0.2),
          ),
        ],
        color: ColorManager.instance?.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(Utility(context).dynamicWidthPixel(5)),
      child: Padding(
        padding: EdgeInsets.all(Utility(context).dynamicWidthPixel(5)),
        child: Image.asset(
          _data[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _startTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (mounted)
        setState(() {
          _time = _time - 1;
        });
    });
  }

  //Restart game
  void restart() {
    _startTime();
    final _data = getLevel(_level, widget.id);
    _cards = getInitialItem(_level);
    _cardState = getCards(_level);
    _time = 2;
    _left = (_data.length ~/ 2);
    _isFinished = false;
    Future.delayed(Duration(seconds: 3), () {
      if (mounted)
        setState(() {
          _start = true;
          _timer.cancel();
        });
    });
  }

  @override
  void initState() {
    restart();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
     
      child: Container(),
    );
  }
}
