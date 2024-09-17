import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../utils/constants.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = DeviceScreenConstants.screenWidth * 0.9;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            children: [
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              ProgressBar(
                width: maxWidth,
                value: 0.5,
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green,
                  ],
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
          ),
          onPressed: _incrementCounter,
          child: Image.asset(
            'assets/png/flippa.png',
            height: 400,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
