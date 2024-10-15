import 'package:flutter/material.dart';
import 'package:get/get.dart';

void cancelAction() => Get.back();

void successSnackBar(title) {
  Get.snackbar(
    'Успешно',
    title,
    backgroundColor: Colors.tealAccent.withOpacity(0.4),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(milliseconds: 1500),
    animationDuration: const Duration(milliseconds: 500),
  );
}

void boosterSnackBar(title) {
  Get.back();
  Get.snackbar(
    'Успешно',
    title,
    backgroundColor: const Color.fromARGB(255, 174, 79, 255).withOpacity(0.4),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(milliseconds: 1500),
    animationDuration: const Duration(milliseconds: 500),
  );
}

void errorSnackBar(title) {
  Get.snackbar(
    'Ошибка',
    title,
    backgroundColor: const Color.fromARGB(255, 255, 82, 111).withOpacity(0.4),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(milliseconds: 1500),
    animationDuration: const Duration(milliseconds: 400),
  );
}
