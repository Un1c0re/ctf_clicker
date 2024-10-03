import 'package:ctf_clicker/controllers/liderboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({super.key});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  final ScoreController controller = Get.put(ScoreController());

  final textStyle = const TextStyle(fontSize: 20);

  final startBorder = const BorderRadius.only(
      topLeft: Radius.circular(6), topRight: Radius.circular(6));

  final endBorder = const BorderRadius.only(
      bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6));

  @override
  Widget build(BuildContext context) {
    final data = controller.getData();

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: DeviceScreenConstants.screenHeight * 0.75,
      ),
      child: ListView.builder(
        itemCount: data.length,
        itemExtent: 50,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index == 5 ? Colors.deepOrangeAccent : const Color.fromRGBO(24, 24, 24, 0.3),
              borderRadius: index == 0
                  ? startBorder
                  : index == data.length - 1
                      ? endBorder
                      : BorderRadius.zero,
              backgroundBlendMode:
                  index % 2 == 0 ? BlendMode.colorBurn : BlendMode.luminosity,
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
                  Text('${data[index]['value']}', style: textStyle),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
