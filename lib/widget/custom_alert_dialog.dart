import 'package:flutter/material.dart';
import 'package:mainingatan/core/basestate.dart';
import 'package:mainingatan/core/constant.dart';
import 'package:mainingatan/core/navigation_constant.dart';
import 'package:mainingatan/core/navigation_manager.dart';

class AdvanceCustomAlert extends StatelessWidget {
  const AdvanceCustomAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: Utility(context).dynamicWidthPixel(225),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                Utility(context).dynamicWidthPixel(10),
                Utility(context).dynamicWidthPixel(55),
                Utility(context).dynamicWidthPixel(10),
                Utility(context).dynamicWidthPixel(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Warning',
                    style: TextStyle(
                      fontSize: Utility(context).dynamicTextSize(20),
                    ),
                  ),
                  SizedBox(
                    height: Utility(context).dynamicWidthPixel(5),
                  ),
                  Text(
                    'All of your progress will be lost, do you want to continue?',
                    style: TextStyle(
                      fontSize: Utility(context).dynamicTextSize(18),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Utility(context).dynamicWidthPixel(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          NavigationService.instance.navigateToPageClear(
                            NavigationConstants.CATEGORIES,
                            Object(),
                          );
                        },
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Utility(context).dynamicTextSize(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Utility(context).dynamicWidthPixel(20),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          NavigationService.instance.navigateToPop();
                        },
                        child: Text(
                          'Resume',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Utility(context).dynamicTextSize(20),
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
              radius: Utility(context).dynamicWidthPixel(40),
              child: Icon(
                Icons.assistant_photo,
                color: Colors.white,
                size: Utility(context).dynamicWidthPixel(45),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
