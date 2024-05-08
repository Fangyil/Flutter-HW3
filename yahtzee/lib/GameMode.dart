import 'package:flutter/material.dart';
import 'package:yahtzee/HomePage.dart';
import 'History.dart';

class GameMode extends StatefulWidget {
  const GameMode({super.key});

  @override
  State<GameMode> createState() => _GameMode();
}

class _GameMode extends State<GameMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            colors: [Color(0xffe5dfd5), Color.fromARGB(255, 211, 202, 247)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'YAHTZEE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Color(0xff832db5),
                ),
              ),
              const SizedBox(height: 70),
              const Text(
                'GAME MODE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: 250.0,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    side: const BorderSide(width: 2, color: Color(0xff6d413f)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const History(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people, size: 40),
                      Text(' FRIEND', style: TextStyle(fontSize: 30)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // SizedBox(
              //   width: 250.0,
              //   height: 50,
              //   child: OutlinedButton(
              //     style: OutlinedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(18.0),
              //       ),
              //       side: const BorderSide(width: 2, color: Color(0xff6d413f)),
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) {
              //           return const HomePage(mode: 0);
              //         }),
              //       );
              //     },
              //     child: const Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Icon(Icons.computer, size: 40),
              //         Text(' COMPUTER', style: TextStyle(fontSize: 25)),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 30),
              SizedBox(
                width: 250.0,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    side: const BorderSide(width: 2, color: Color(0xff6d413f)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(mode: 1),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.smart_display, size: 40),
                      Text(' START ', style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
