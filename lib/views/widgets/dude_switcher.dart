import 'dart:async';
import 'package:flutter/material.dart';

class DudeSwitcher extends StatefulWidget {
  const DudeSwitcher({super.key});

  @override
  State<DudeSwitcher> createState() => _DudeSwitcherState();
}

class _DudeSwitcherState extends State<DudeSwitcher> {
  List<String> images = [
    'assets/images/emoji/angel.png',
    'assets/images/emoji/cool.png',
    'assets/images/emoji/default.png',
    'assets/images/emoji/oops.png',
    'assets/images/emoji/star.png',
  ];
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        switchInCurve: Curves.elasticInOut,
        switchOutCurve: Curves.elasticInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: Image.asset(
          images[_currentIndex],
          key: ValueKey<int>(_currentIndex),
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
