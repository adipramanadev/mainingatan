import 'package:flutter/material.dart';
import 'package:mainingatan/core/basestate.dart';
import 'package:mainingatan/core/constant.dart';

class MyContainers extends StatelessWidget {
  final Color colours;
  final String title;
  MyContainers({required this.colours, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        Utility(context).dynamicWidthPixel(10),
      ),
      child: Container(
        height: Utility(context).dynamicWidthPixel(65),
        width: Utility(context).dynamicWidthPixel(360),
        decoration: BoxDecoration(
            color: colours, borderRadius: BorderRadius.circular(20)),
        child: Container(
          child: Padding(
            padding:
                EdgeInsets.only(top: Utility(context).dynamicWidthPixel(10)),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorManager.instance?.white,
                fontFamily: 'Bubblegum',
                fontSize: Utility(context).dynamicTextSize(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
