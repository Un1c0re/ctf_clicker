import 'package:get/get.dart';
import 'booster_controller.dart';

class TapController extends GetxController {
  var counter = 0.0.obs;
  final BoosterController boosterController = Get.put(BoosterController());

  void incrementCounter(double skinValue) {
    double multiplier = 1;

    boosterController.activeBoosters.forEach((booster, remainingTime) {
      multiplier *= booster.value;
    });

    counter.value += skinValue * multiplier;
  }

  bool canDecrementCounter(int value) => counter.value > value;

  void decrementCounter(int price) {
    counter.value -= price;
  }
}
