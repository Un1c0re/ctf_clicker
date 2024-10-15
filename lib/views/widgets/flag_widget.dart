import 'package:ctf_clicker/controllers/flag_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/tap_controller.dart';
import '../../utils/constants.dart';
import '../../utils/snackbars.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FlagController());
    final tapController = Get.find<TapController>();

    final flag = controller.getFlag();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      constraints: BoxConstraints(
        maxHeight: DeviceScreenConstants.screenHeight * 0.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(flag.path),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Capture the flag!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text('Стоит: ${flag.price}'),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  bool canBuy = tapController.canDecrementCounter(flag.price);
                  if (!canBuy) {
                    errorSnackBar('нет денег');
                    return;
                  }
                  tapController.decrementCounter(flag.price);
                  await controller.getFlagValue();
                  successSnackBar('Вы получили флаг!');
                },
                child: const Text('Купить!'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
