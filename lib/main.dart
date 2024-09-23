import 'package:ctf_clicker/utils/constants.dart';
import 'package:ctf_clicker/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceScreenConstants.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clicker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(title: 'Click The Flag'),
    );
  }
}
