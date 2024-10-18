import 'package:ctf_clicker/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'booster_controller.dart';

class TapController extends GetxController {
  var counter = 0.0.obs;
  final BoosterController boosterController = Get.put(BoosterController());
  final UserController userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    counter.value = userController.getUser()!.wallet;
  }

  void incrementCounter(double skinValue) {
    double multiplier = 1;

    boosterController.activeBoosters.forEach((booster, remainingTime) {
      multiplier *= booster.value;
    });
    counter.value += skinValue * multiplier;
    userController.getUser()!.wallet = counter.value;
  }

  bool canDecrementCounter(int value) => counter.value > value;

  void decrementCounter(int price) {
    counter.value -= price;
    userController.getUser()!.wallet = counter.value;
  }
}
