import 'package:ctf_clicker/controllers/tap_controller.dart';
import 'package:ctf_clicker/controllers/user_controller.dart';
import 'package:ctf_clicker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/skin_model.dart';
import '../../utils/snackbars.dart';

class SkinShopWidget extends StatelessWidget {
  final Skin skin;

  const SkinShopWidget({super.key, required this.skin});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final tapController = Get.find<TapController>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      constraints: BoxConstraints(
        maxHeight: DeviceScreenConstants.screenHeight * 0.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(skin.path, height: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(skin.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text('Добавляет +${skin.tapValue}'),
                  Text('Стоит: ${skin.price}'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  bool canBuy = tapController.canDecrementCounter(skin.price);
                  if (!canBuy) {
                    errorSnackBar('нет денег');
                    return;
                  }
                  tapController.decrementCounter(skin.price);
                  userController.setSkin(skin);
                },
                child: const Text('купить!'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
