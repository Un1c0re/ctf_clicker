import 'dart:async';
import 'package:ctf_clicker/utils/snackbars.dart';
import 'package:get/get.dart';
import '../models/booster_model.dart';

class BoosterController extends GetxController {
  var activeBoosters = <Booster, int>{}.obs;
  Map<Booster, Timer> boosterTimers = {};

  void activateBooster(Booster booster, double counter) {
    if (activeBoosters.containsKey(booster)) {
      errorSnackBar('Бустер уже активирован');
      return;
    }
    if (counter < booster.price) {
      errorSnackBar('Недостаточно монет');
      return;
    }

    activeBoosters[booster] = booster.duration;
    boosterTimers[booster] =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      if (activeBoosters[booster]! > 0) {
        activeBoosters[booster] = activeBoosters[booster]! - 1;
      } else {
        timer.cancel();
        boosterTimers.remove(booster);
        activeBoosters.remove(booster);
      }
    });
  }

  @override
  void onClose() {
    boosterTimers.forEach((booster, timer) {
      timer.cancel();
    });
    boosterTimers.clear();
    super.onClose();
  }
}
