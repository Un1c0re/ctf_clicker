import 'package:flutter/material.dart';

import '../models/booster_model.dart';
import '../models/skin_model.dart';

abstract class DeviceScreenConstants {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
  }
}

final List<Booster> boosters = [
  Booster(name: 'x2', price: 5, value: 2, duration: 5),
  Booster(name: 'x3', price: 15, value: 3, duration: 10),
  Booster(name: 'x5', price: 30, value: 5, duration: 15),
  Booster(name: 'x10', price: 50, value: 5, duration: 25),
];

final List<Skin> skins = [
  Skin(
      path: 'assets/images/emoji/cool.png',
      name: 'cool dude',
      price: 1000,
      tapValue: 1),
  Skin(
      path: 'assets/images/emoji/angel.png',
      name: 'saint dude',
      price: 2000,
      tapValue: 2),
  Skin(
      path: 'assets/images/emoji/oops.png',
      name: 'passed out dude',
      price: 3000,
      tapValue: 3),
  Skin(
      path: 'assets/images/emoji/star.png',
      name: 'happy dude',
      price: 4000,
      tapValue: 4),
];
