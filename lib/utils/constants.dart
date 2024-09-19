import 'package:flutter/material.dart';

abstract class DeviceScreenConstants {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
  }
}

const int MAX_COUNTER = 1000000;
const double TAP_COIN = 0.1;
