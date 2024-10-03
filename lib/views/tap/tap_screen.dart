import 'package:ctf_clicker/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/tap_controller.dart';
import '../../utils/constants.dart';
import '../widgets/booster_widget.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> with TickerProviderStateMixin {
  final TapController controller = Get.put(TapController());
  final UserController userController = Get.put(UserController());

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap(double tapValue) {
    _controller.forward().then((_) => _controller.reverse());
    controller.incrementCounter(tapValue);
  }

  @override
  Widget build(BuildContext context) {
    final userSkin = userController.getSkin();
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
                      controller.counter.value.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Text('Скин: ${userSkin.name}'),
            Text('Дает: +${userSkin.tapValue} дюдкоинов')
          ],
        ),
        GestureDetector(
          onTap: () => _onTap(userSkin.tapValue),
          child: ScaleTransition(
            scale: _animation,
            child: Center(
              child: Image.asset(
                userSkin.path,
                height: 320,
              ),
            ),
          ),
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text('Бустеры',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10.0,
              runSpacing: 10.0,
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
