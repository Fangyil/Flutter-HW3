import 'package:flutter/material.dart';
import 'package:yahtzee/GameMode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YAHTZEE',
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffC49beb)),
        useMaterial3: true,
      ),
      home: const GameMode(),
    );
  }
}
