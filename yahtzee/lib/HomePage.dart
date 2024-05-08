import 'package:flutter/material.dart';
import 'package:yahtzee/WhoseTurn.dart';
import 'package:yahtzee/WinLose.dart';
import 'PlayBoard.dart';
import 'RollDice.dart';

class Player {
  String name;
  int score;
  int bonus;
  int win;
  int lose;
  int tie;
  String image;
  Player(
      {required this.name,
      required this.score,
      required this.bonus,
      required this.win,
      required this.lose,
      required this.tie,
      required this.image});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.mode});

  final int mode;
  static ValueNotifier<int> player = ValueNotifier<int>(0);
  static ValueNotifier<int> round = ValueNotifier<int>(0);
  static ValueNotifier<int> selectedBlank = ValueNotifier<int>(-1);
  static ValueNotifier<bool> click = ValueNotifier<bool>(false);
  static ValueNotifier<List<Player>> playerScore = ValueNotifier<List<Player>>([
    Player(
        name: 'Player 1',
        score: 0,
        bonus: 0,
        win: 0,
        lose: 0,
        tie: 0,
        image: ''),
    Player(
        name: 'Player 2',
        score: 0,
        bonus: 0,
        win: 0,
        lose: 0,
        tie: 0,
        image: ''),
  ]);
  static ValueNotifier<List<Blank>> blankList = ValueNotifier<List<Blank>>([
    Blank(index: 0, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 1, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 2, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 3, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 4, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 5, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 6, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 7, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 8, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 9, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 10, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 11, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 12, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 13, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 14, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 15, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 16, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 17, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 18, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 19, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 20, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 21, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 22, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 23, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 24, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 25, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 26, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 27, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 28, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 29, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 30, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 31, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 32, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 33, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 34, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 35, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 36, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 37, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 38, value: -1, tmpValue: -1, turn: 1),
    Blank(index: 39, value: -1, tmpValue: -1, turn: -1),
    Blank(index: 40, value: -1, tmpValue: -1, turn: 0),
    Blank(index: 41, value: -1, tmpValue: -1, turn: 1),
  ]);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // here the desired height
        child: ValueListenableBuilder<int>(
          valueListenable: HomePage.round,
          // value前面的int代表值的类型，使用时一定明确指定该类型
          builder: (BuildContext context, int round, Widget? child) {
            return Offstage(
              offstage: (HomePage.round.value < 13) ? false : true,
              child: AppBar(
                backgroundColor: const Color(0xffb699cc),
                title: ValueListenableBuilder<int>(
                  valueListenable: HomePage.round,
                  // value前面的int代表值的类型，使用时一定明确指定该类型
                  builder: (BuildContext context, int round, Widget? child) {
                    return const WhoseTurn();
                  },
                ),
              ),
            );
          },
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: HomePage.round,
        // value前面的int代表值的类型，使用时一定明确指定该类型
        builder: (BuildContext context, int round, Widget? child) {
          return Center(
            child: (HomePage.round.value < 13)
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25),
                      Expanded(
                        flex: 2,
                        child: PlayBoard(),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: RollDice(),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                : const WinLose(),
          );
        },
      ),
    );
  }
}
