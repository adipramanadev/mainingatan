import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mainingatan/core/basestate.dart';
import 'package:mainingatan/core/constant.dart';
import 'package:mainingatan/data/brain.dart';

import '../core/navigation_constant.dart';
import '../core/navigation_manager.dart';
import '../widget/custom_alert_dialog.dart';

class GameScreen extends StatefulWidget {
  final Level _level;
  final int id;

  GameScreen(this._level, this.id);
  @override
  _GameScreenState createState() => _GameScreenState(_level);
}

class _GameScreenState extends BaseState<GameScreen> {
  _GameScreenState(this._level);

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
    _data = getLevel(_level, widget.id) as List<String>;
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
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: _isFinished
          ? Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Selamat!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: dynamicTextSize(22),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        dynamicWidthPixel(16),
                      ),
                      child: Container(
                        height: Utility(context).dynamicWidthPixel(250),
                        width: Utility(context).dynamicWidthPixel(250),
                        child: Lottie.asset(
                          'assets/badge.json',
                          repeat: true,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (mounted) {
                          setState(
                            () {
                              NavigationService.instance.navigateToPage(
                                  NavigationConstants.CATEGORIES, Object());
                            },
                          );
                        }
                      },
                      child: Container(
                        width: dynamicWidth(0.70),
                        height: dynamicWidthPixel(100),
                        decoration: BoxDecoration(
                          color: ColorManager.instance!.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "Play Again",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: _time > 0
                    ? Text(
                        'Ready? $_time',
                        style: TextStyle(
                          fontSize: Utility(context).dynamicTextSize(20),
                        ),
                      )
                    : Text(
                        'Remaining Cards: $_left',
                        style: TextStyle(
                          fontSize: Utility(context).dynamicTextSize(20),
                        ),
                      ),
                actions: _time > 0
                    ? []
                    : [
                        Padding(
                          padding: EdgeInsets.only(
                            right: Utility(context).dynamicWidthPixel(15),
                          ),
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AdvanceCustomAlert();
                                },
                              );
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/close.svg",
                              color: ColorManager.instance!.white,
                            ),
                          ),
                        )
                      ],
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                          Utility(context).dynamicWidthPixel(16),
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemBuilder: (context, index) => _start
                              ? FlipCard(
                                  key: _cardState[index],
                                  onFlip: () {
                                    if (!_flip) {
                                      _flip = true;
                                      _previousIndex = index;
                                    } else {
                                      _flip = false;
                                      if (_previousIndex != index) {
                                        if (_data[_previousIndex] !=
                                            _data[index]) {
                                          _wait = true;

                                          Future.delayed(
                                              const Duration(milliseconds: 900),
                                              () {
                                            _cardState[_previousIndex]
                                                .currentState!
                                                .toggleCard();
                                            _previousIndex = index;
                                            _cardState[_previousIndex]
                                                .currentState!
                                                .toggleCard();

                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 160), () {
                                              if (mounted)
                                                setState(() {
                                                  _wait = false;
                                                });
                                            });
                                          });
                                        } else {
                                          _cards[_previousIndex] = false;
                                          _cards[index] = false;
                                          print(_cards);
                                          if (mounted)
                                            setState(() {
                                              _left -= 1;
                                            });
                                          if (_cards.every((t) => t == false)) {
                                            print("Won");
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 160), () {
                                              if (mounted)
                                                setState(() {
                                                  _isFinished = true;
                                                  _start = false;
                                                });
                                            });
                                          }
                                        }
                                      }
                                    }
                                    if (mounted) setState(() {});
                                  },
                                  flipOnTouch: _wait ? false : _cards[index],
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 0.1,
                                            blurRadius: 5,
                                            offset: Offset(0.1, 0.2),
                                          ),
                                        ],
                                        color: ColorManager.instance!.white,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      margin: EdgeInsets.all(
                                        Utility(context).dynamicWidthPixel(4),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          "images/card_close.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                  back: getItem(index))
                              : getItem(index),
                          itemCount: _data.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
