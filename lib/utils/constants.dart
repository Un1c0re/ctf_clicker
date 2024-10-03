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

const int MAX_COUNTER = 1000000;
const double TAP_COIN = 0.1;

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

List<dynamic> RAW_DATA = [
  {'name': 'dude1', 'value': 100},
  {'name': 'dude2', 'value': 20},
  {'name': 'dude3', 'value': 50},
  {'name': 'dude4', 'value': 65},
  {'name': 'dude5', 'value': 80},
  {'name': 'dude6', 'value': 999},
  {'name': 'dude7', 'value': 90},
  {'name': 'dude8', 'value': 48},
  {'name': 'dude9', 'value': 340},
  {'name': 'dude9', 'value': 141},
  {'name': 'dude9', 'value': 240},
  {'name': 'dude10', 'value': 21},
  {'name': 'dude10', 'value': 21},
  {'name': 'dude10', 'value': 21},
  {'name': 'dude10', 'value': 24},
  {'name': 'dude10', 'value': 20},
  {'name': 'dude10', 'value': 21},
  {'name': 'dude10', 'value': 22},
  {'name': 'dude10', 'value': 21},
];
