import 'package:ctf_clicker/views/widgets/skin_shop_widget.dart';
import 'package:flutter/material.dart';

import '../../models/skin_model.dart';
import '../../utils/constants.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<Skin> skins = [
    Skin(
        path: 'assets/images/emoji/angel.png',
        name: 'Ангелок',
        price: 100,
        tapValue: 0.5),
    Skin(
        path: 'assets/images/emoji/cool.png',
        name: 'Крутой чел',
        price: 100,
        tapValue: 0.5),
    Skin(
        path: 'assets/images/emoji/oops.png',
        name: 'Жахнутый',
        price: 100,
        tapValue: 0.5),
    Skin(
        path: 'assets/images/emoji/star.png',
        name: 'Веселый чел',
        price: 100,
        tapValue: 0.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: DeviceScreenConstants.screenHeight * 0.06),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: skins.map((skin) => SkinShopWidget(skin: skin)).toList(),
        ),
      ),
    );
  }
}
