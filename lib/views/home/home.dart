import 'package:ctf_clicker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = DeviceScreenConstants.screenWidth * 0.9;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(83, 105, 118, 1),
            Color.fromRGBO(41, 46, 73, 1)
          ]),
        ),
        child: Column(
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
        ),
      ),
      extendBody: true,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.accessible_forward),
            title: Text("Тап"),
            selectedColor: Colors.lime,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text("Шоп"),
            selectedColor: Colors.cyan,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.bar_chart),
            title: Text("Борд"),
            selectedColor: Colors.pinkAccent,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Профиль"),
            selectedColor: Colors.tealAccent,
          ),
        ],
      ),
    );
  }
}
