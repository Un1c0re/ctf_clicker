import 'package:ctf_clicker/utils/constants.dart';
import 'package:ctf_clicker/views/board/board_screen.dart';
import 'package:ctf_clicker/views/profile/profile_screen.dart';
import 'package:ctf_clicker/views/shop/shop_screen.dart';
import 'package:ctf_clicker/views/tap/tap_screen.dart';
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

  static final List<Widget> _widgetTabs = <Widget>[
    const TapScreen(),
    const ShopScreen(),
    const BoardScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
      ),
      body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(83, 105, 118, 1),
              Color.fromRGBO(41, 46, 73, 1)
            ]),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 80, right: 8, bottom: 8),
            child: _widgetTabs[_currentIndex],
          )),
      extendBody: true,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.accessible_forward),
            title: const Text("Тап"),
            selectedColor: Colors.lime,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.account_balance_wallet),
            title: const Text("Шоп"),
            selectedColor: Colors.cyan,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.bar_chart),
            title: const Text("Борд"),
            selectedColor: Colors.pinkAccent,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Профиль"),
            selectedColor: Colors.tealAccent,
          ),
        ],
      ),
    );
  }
}
