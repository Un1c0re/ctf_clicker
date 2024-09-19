import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../utils/constants.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  double _counter = 0.0;

  void _incrementCounter() {
    setState(() {
      _counter += TAP_COIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Text(
              '${_counter.toStringAsFixed(1)} / $MAX_COUNTER',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ProgressBar(
              width: double.maxFinite,
              value: _counter / MAX_COUNTER,
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.green,
                ],
              ),
            ),
          ],
        ),
        TapContainer(onTap: _incrementCounter),
        const SizedBox(height: 50),
      ],
    );
  }
}

class TapContainer extends StatefulWidget {
  final VoidCallback onTap;

  const TapContainer({super.key, required this.onTap});

  @override
  State<TapContainer> createState() => _TapContainerState();
}

class _TapContainerState extends State<TapContainer>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  );
  late final Animation<double> _animation =
      Tween<double>(begin: 1.0, end: 1.1).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 500, maxWidth: 500),
      child: GestureDetector(
        onTap: _onTap,
        child: ScaleTransition(
          scale: _animation,
          child: Center(
            child: Image.asset(
              'assets/png/emoji/cool.png',
            ),
          ),
        ),
      ),
    );
  }
}
