import 'package:ctf_clicker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/tap_controller.dart';
import '../../models/booster_model.dart';

class BoosterWidget extends StatelessWidget {
  final Booster booster;
  final VoidCallback onActivate;

  const BoosterWidget({
    super.key,
    required this.booster,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    final TapController controller = Get.find<TapController>();

    return Obx(() => GestureDetector(
          onTap: onActivate,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white12,
                width: 0.8,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(12),
              color: controller.activeBooster.value == booster
                  ? Colors.purple
                  : Colors.transparent,
            ),
            constraints: BoxConstraints(
              maxWidth: DeviceScreenConstants.screenWidth * 0.45,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/coin.png', height: 32),
                const SizedBox(width: 8),
                controller.activeBooster.value == booster
                    ? Text(
                        '${controller.remainingTime.value}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      )
                    : Column(
                        children: [
                          Text(
                            booster.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'cost: ${booster.price}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ));
  }
}
