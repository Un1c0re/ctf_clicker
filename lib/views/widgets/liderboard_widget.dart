import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({super.key});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  List<dynamic> data = [
    {'name': 'dude1', 'value': 100},
    {'name': 'dude2', 'value': 20},
    {'name': 'dude3', 'value': 50},
    {'name': 'dude4', 'value': 65},
    {'name': 'dude5', 'value': 80},
    {'name': 'dude6', 'value': 999},
    {'name': 'dude7', 'value': 90},
    {'name': 'dude8', 'value': 48},
    {'name': 'dude9', 'value': 340},
    {'name': 'dude10', 'value': 21},
  ];

  final textStyle = const TextStyle(fontSize: 20);

  final startBorder = const BorderRadius.only(
      topLeft: Radius.circular(6), topRight: Radius.circular(6));

  final endBorder = const BorderRadius.only(
      bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6));

  @override
  Widget build(BuildContext context) {
    data.sort((a, b) => b['value'].compareTo(a['value']));

    return Container(
      constraints: BoxConstraints(
        maxHeight: DeviceScreenConstants.screenHeight * 0.8,
      ),
      child: Align(
        child: ListView.builder(
          itemCount: data.length,
          itemExtent: 50,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(24, 24, 24, 0.3),
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
      ),
    );
  }
}
