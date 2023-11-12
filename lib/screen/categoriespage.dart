import 'package:flutter/material.dart';
import 'package:mainingatan/core/basestate.dart';
import 'package:mainingatan/core/constant.dart';
import 'package:mainingatan/data/categorimockdata.dart';
import 'package:mainingatan/screen/levelscreen.dart';
import 'package:mainingatan/widget/close_custom_alert.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return CloseCustomAlert();
            });
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.instance?.yellow,
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            Utility(context).dynamicHeightPixel(20),
            Utility(context).dynamicHeightPixel(100),
            Utility(context).dynamicHeightPixel(20),
            Utility(context).dynamicHeightPixel(30),
          ),
          child: GridView.builder(
            itemCount: texts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 2
                      : 2,
              crossAxisSpacing: Utility(context).dynamicWidthPixel(15),
              mainAxisSpacing: Utility(context).dynamicWidthPixel(15),
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print(texts[index]["id"]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LevelScreen(
                        id: texts[index]["id"],
                      ),
                    ),
                  );
                  // Navigator.of(context).pushNamed();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorManager.instance?.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          texts[index]["image"],
                          scale: 9,
                        ),
                        Text(
                          texts[index]["title"],
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
