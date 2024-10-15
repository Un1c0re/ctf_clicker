import 'package:ctf_clicker/controllers/flag_controller.dart';
import 'package:ctf_clicker/controllers/tap_controller.dart';
import 'package:ctf_clicker/controllers/user_controller.dart';
import 'package:ctf_clicker/utils/constants.dart';
import 'package:ctf_clicker/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    final UserModel currentUser = controller.getUser()!;

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
        SizedBox(height: DeviceScreenConstants.screenHeight * 0.2),
        Obx(() {
          var flag = flagController.getFlag();
          fieldController.text = flag.flag;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(flag.flag.isEmpty
                    ? 'Здесь будет ваш флаг, когда вы его откроете'
                    : 'Скорее используйте флаг!'),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 15)),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: Colors.greenAccent),
                          ),
                        ),
                      ),
                      child: Text(
                        flag.flag.isEmpty ? '##########' : flag.flag,
                        style: const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}
