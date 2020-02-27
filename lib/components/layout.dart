import 'package:flutter/widgets.dart';

class SizeConfig{
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHight;
  static double blockHorizontal;
  static double blockVertical;
  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenHight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    blockHorizontal = screenWidth / 100;
    blockVertical = screenHight / 100;
  }
}