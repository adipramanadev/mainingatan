import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mainingatan/core/basestate.dart';
import 'package:mainingatan/core/constant.dart';
import 'package:mainingatan/core/navigation_manager.dart';

class CloseCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final utility = Utility(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: utility.dynamicWidthPixel(225),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(
                    'Warning',
                    style: TextStyle(
                      fontSize: utility.dynamicTextSize(20),
                    ),
                  ),
                  SizedBox(
                    height: utility.dynamicWidthPixel(5),
                  ),
                  Text(
                    'Do you want to close the application?',
                    style: TextStyle(
                      fontSize: utility.dynamicTextSize(20),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: utility.dynamicWidthPixel(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: utility.dynamicTextSize(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: utility.dynamicWidthPixel(20),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          NavigationService.instance.navigateToPop();
                        },
                        child: Text(
                          'Resume',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: utility.dynamicTextSize(20),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -30,
            child: CircleAvatar(
              backgroundColor: ColorManager.instance?.yellow,
              radius: utility.dynamicWidthPixel(40),
              child: Icon(
                Icons.assistant_photo,
                color: Colors.white,
                size: utility.dynamicWidthPixel(45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
