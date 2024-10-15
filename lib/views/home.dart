import 'package:ctf_clicker/views/score/score_screen.dart';
import 'package:ctf_clicker/views/profile/profile_screen.dart';
import 'package:ctf_clicker/views/shop/shop_screen.dart';
import 'package:ctf_clicker/views/tap/tap_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  static final List<Widget> _widgetTabs = <Widget>[
    const TapScreen(),
    const ShopScreen(),
    const ScoreScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
