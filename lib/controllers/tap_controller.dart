import 'package:ctf_clicker/utils/constants.dart';
import 'package:get/get.dart';
import 'booster_controller.dart';

class TapController extends GetxController {
  var counter = 0.0.obs;
  final BoosterController boosterController = Get.put(BoosterController());

  void incrementCounter() {
    double multiplier = 1;

    boosterController.activeBoosters.forEach((booster, remainingTime) {
      multiplier *= booster.value;
    });

    counter.value += TAP_COIN * multiplier;
  }
}
