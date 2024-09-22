import 'dart:async';

import 'package:ctf_clicker/utils/snackbars.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../models/booster_model.dart';

class TapController extends GetxController {
  var counter = 0.0.obs;
  var activeBooster = Rxn<Booster>();
  var remainingTime = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    ever(activeBooster, (booster) {
      if (booster != null) {
        remainingTime.value = booster.duration;
        _startTimer(booster.duration);
      }
    });
    super.onInit();
  }

  void incrementCounter() {
    if (activeBooster.value != null) {
      counter.value += TAP_COIN * activeBooster.value!.value;
    } else {
      counter.value += TAP_COIN;
    }
  }

  void _startTimer(int duration) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer?.cancel();
        activeBooster.value = null;
      }
    });
  }

  void activateBooster(Booster booster) {
    if (activeBooster.value != null && activeBooster.value == booster) {
      errorSnackBar('Бустер уже активирован');
      return;
    }

    if (counter.value < booster.price) {
      errorSnackBar('Нет денег');
      return;
    }

    activeBooster.value = booster;
    counter.value -= booster.price;
    boosterSnackBar('Бустер x${booster.value.round()} активирован');
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
