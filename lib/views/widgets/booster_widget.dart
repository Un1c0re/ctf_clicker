import 'package:ctf_clicker/controllers/booster_controller.dart';
import 'package:ctf_clicker/controllers/tap_controller.dart';
import 'package:ctf_clicker/utils/constants.dart';
import 'package:ctf_clicker/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/booster_model.dart';

class BoosterWidget extends StatefulWidget {
  final Booster booster;
  final double currentCount;

  const BoosterWidget({
    super.key,
    required this.booster,
    required this.currentCount,
  });

  @override
  _BoosterWidgetState createState() => _BoosterWidgetState();
}

class _BoosterWidgetState extends State<BoosterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.yellow.shade700,
      end: Colors.deepPurpleAccent,
    ).animate(_colorController);
  }

  @override
  void dispose() {
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BoosterController controller = Get.find<BoosterController>();
    final TapController tapController = Get.find<TapController>();

    return GestureDetector(
      onTap: () {
        bool canActivate = controller.canActivateBooster(widget.booster);
        bool canBuy = tapController.canDecrementCounter(widget.booster.price);

        if (!canBuy) {
          errorSnackBar('нет денег');
          return;
        }

        if (!canActivate) {
          errorSnackBar('Бустер уже активирован');
          return;
        }

        tapController.decrementCounter(widget.booster.price);
        controller.activateBooster(widget.booster);
      },
      child: Obx(() {
        bool isActive = controller.activeBoosters.containsKey(widget.booster);
        int remainingTime =
            isActive ? controller.activeBoosters[widget.booster]! : 0;

        return AnimatedBuilder(
          animation: _colorController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white12,
                  width: 0.8,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),
                color: isActive ? _colorAnimation.value : Colors.transparent,
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
                          widget.booster.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Стоит: ${widget.booster.price}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
