import 'package:ctf_clicker/controllers/score_controller.dart';
import 'package:ctf_clicker/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class ScoreWidget extends StatelessWidget {
  ScoreWidget({super.key});

  final ScoreController controller = Get.put(ScoreController());
  final UserController userController = Get.put(UserController());

  final textStyle = const TextStyle(fontSize: 20);

  final startBorder = const BorderRadius.only(
      topLeft: Radius.circular(6), topRight: Radius.circular(6));

  final endBorder = const BorderRadius.only(
      bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6));

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: DeviceScreenConstants.screenHeight * 0.7,
      ),
      child: Obx(() {
        final data = controller.scoreData;
        final user = userController.getUser()!;
        print(user.id);

        if (data.isEmpty) {
          return const Center(
            child: Text(
              'Скоро здесь появится список форбс',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        }

        return ListView.builder(
          itemCount: data.length,
          itemExtent: 50,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: data[index]['id'] == user.id
                    ? Colors.deepOrangeAccent.withOpacity(0.5)
                    : index % 2 == 0
                        ? const Color.fromRGBO(24, 24, 24, 0.3)
                        : const Color.fromRGBO(24, 24, 24, 0.5),
                borderRadius: index == 0
                    ? startBorder
                    : index == data.length - 1
                        ? endBorder
                        : BorderRadius.zero,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: DeviceScreenConstants.screenWidth * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 30,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('${index + 1}', style: textStyle)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(data[index]['name'], style: textStyle)),
                    Text(data[index]['score'].toStringAsFixed(1),
                        style: textStyle),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
