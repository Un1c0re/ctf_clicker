import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../controllers/tap_controller.dart';
import '../../models/booster_model.dart';
import '../../utils/constants.dart';
import '../widgets/booster_widget.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> with TickerProviderStateMixin {
  final TapController controller = Get.put(TapController());

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  );

  late final Animation<double> _animation =
      Tween<double>(begin: 1.0, end: 1.1).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ),
  );

  final List<Booster> boosters = [
    Booster(name: 'x2', price: 5, value: 2, duration: 5),
    Booster(name: 'x3', price: 15, value: 3, duration: 10),
    Booster(name: 'x5', price: 30, value: 5, duration: 15),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    _controller.forward().then((_) => _controller.reverse());
    controller.incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/coin.png', height: 32),
                const SizedBox(width: 10),
                Obx(() => Text(
                      '${controller.counter.value.toStringAsFixed(1)} / $MAX_COUNTER',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() => ProgressBar(
                  width: double.maxFinite,
                  value: controller.counter.value / MAX_COUNTER,
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.green,
                    ],
                  ),
                )),
          ],
        ),
        GestureDetector(
          onTap: _onTap,
          child: ScaleTransition(
            scale: _animation,
            child: Center(
              child: Image.asset(
                'assets/images/emoji/cool.png',
                height: 300,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Бустеры',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
            const SizedBox(height: 5),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: boosters.map((booster) {
                return Obx(
                  () => BoosterWidget(
                    booster: booster,
                    currentCount: controller.counter.value,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
