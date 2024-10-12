import 'package:ctf_clicker/controllers/flag_controller.dart';
import 'package:ctf_clicker/controllers/tap_controller.dart';
import 'package:ctf_clicker/controllers/user_controller.dart';
import 'package:ctf_clicker/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/flag_model.dart';
import '../../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserController controller = Get.put(UserController());
  final FlagController flagController = Get.put(FlagController());
  final TapController tapController = Get.put(TapController());
  final TextEditingController fieldController = TextEditingController();

  final flagInputDecoration = flagField.copyWith(
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabled: false,
  );

  void setFlagField(String value) {
    fieldController.text = value;
  }

  @override
  Widget build(BuildContext context) {
    final UserModel currentUser = controller.getUser()!;
    final Flag flag = flagController.getFlag();

    if (flag.value.isNotEmpty) {
      setFlagField(flag.value);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Image.asset(currentUser.skin.path, height: 128),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => Text(
                    'total count: ${tapController.counter.value.toStringAsFixed(1)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(flag.path.isNotEmpty
                ? 'Здесь будет ваш флаг, когда вы его откроете'
                : 'Скорее используйте флаг!'),
            TextField(decoration: flagInputDecoration, enabled: false),
          ],
        ),
      ],
    );
  }
}
