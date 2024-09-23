import 'package:ctf_clicker/controllers/booster_controller.dart';
import 'package:ctf_clicker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/booster_model.dart';

class BoosterWidget extends StatelessWidget {
  final Booster booster;
  final currentCount;

  const BoosterWidget({
    super.key,
    required this.booster,
    required this.currentCount,
  });

  @override
  Widget build(BuildContext context) {
    final BoosterController controller = Get.find<BoosterController>();

    return GestureDetector(
      onTap: () => controller.activateBooster(booster, currentCount),
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
