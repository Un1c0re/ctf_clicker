import 'package:ctf_clicker/views/widgets/flag_widget.dart';
import 'package:ctf_clicker/views/widgets/skin_shop_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: DeviceScreenConstants.screenHeight * 0.06),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...skins.map((skin) => SkinShopWidget(skin: skin)),
            const FlagWidget(),
          ],
        ),
      ),
    );
  }
}
