import 'package:ctf_clicker/controllers/user_controller.dart';
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

  final flagInputDecoration = flagField.copyWith(
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabled: true,
  );

  @override
  Widget build(BuildContext context) {
    final UserModel currentUser = controller.user();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Image.asset(currentUser.skin.path, height: 128),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'total count: ${currentUser.count}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Здесь будет ваш флаг, когда вы его откроете'),
            TextField(decoration: flagInputDecoration),
          ],
        ),
      ],
    );
  }
}
