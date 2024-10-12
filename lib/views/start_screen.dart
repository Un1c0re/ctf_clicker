import 'package:ctf_clicker/controllers/user_controller.dart';
import 'package:ctf_clicker/utils/snackbars.dart';
import 'package:ctf_clicker/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  UserController controller = Get.put(UserController());

  Future<void> toHomeScreen() async {
    if (controller.getUser() == null) {
      try {
        await controller.regUser();
        Get.offAll(() => const HomeScreen());
      } catch (exception) {
        errorSnackBar(exception.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Click The Flag',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      extendBody: true,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(63, 85, 98, 1),
                Color.fromRGBO(31, 36, 63, 1)
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 80, right: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Click the Dude!'),
              ElevatedButton(
                onPressed: () async {
                  await toHomeScreen();
                },
                child: const Text('Начать'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
