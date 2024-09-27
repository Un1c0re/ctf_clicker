import 'package:ctf_clicker/controllers/booster_controller.dart';
import 'package:ctf_clicker/controllers/tap_controller.dart';
import 'package:ctf_clicker/utils/constants.dart';
import 'package:ctf_clicker/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/booster_model.dart';

class BoosterWidget extends StatelessWidget {
  final Booster booster;
  final double currentCount;

  const BoosterWidget({
    super.key,
    required this.booster,
    required this.currentCount,
  });

  @override
  Widget build(BuildContext context) {
    final BoosterController controller = Get.find<BoosterController>();
    final TapController tapController = Get.find<TapController>();

    return GestureDetector(
      onTap: () {
        bool canActivate = controller.canActivateBooster(booster);
        bool canBuy = tapController.canDecrementCounter(booster.price);

        if (!canBuy) {
          errorSnackBar('нет денег');
          return;
        }

        if (!canActivate) {
          errorSnackBar('Бустер уже активирован');
          return;
        }

        tapController.decrementCounter(booster.price);
        controller.activateBooster(booster);
      },
      child: Obx(() {
        bool isActive = controller.activeBoosters.containsKey(booster);
        int remainingTime = isActive ? controller.activeBoosters[booster]! : 0;

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white12,
              width: 0.8,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(12),
            color: isActive ? Colors.purple : Colors.transparent,
          ),
          constraints: BoxConstraints(
            maxWidth: DeviceScreenConstants.screenWidth * 0.45,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/coin.png', height: 32),
              const SizedBox(width: 8),
              if (isActive)
                Text(
                  '$remainingTime',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              else
                Column(
                  children: [
                    Text(
                      booster.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Стоит: ${booster.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      }),
    );
  }
}
