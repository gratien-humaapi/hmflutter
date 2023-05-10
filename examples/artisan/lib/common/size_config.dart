import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
  }

  static bool isMobile() => _mediaQueryData.size.width < 450;

  static bool isTablet() => _mediaQueryData.size.width >= 450;
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  final double height = (inputHeight / 812.0) * screenHeight;
  return SizeConfig.isMobile() ? height : inputHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  final double width = (inputWidth / 375.0) * screenWidth;
  return SizeConfig.isMobile() ? width : inputWidth;
}
