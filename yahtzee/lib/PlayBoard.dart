import 'package:flutter/material.dart';
import 'package:yahtzee/HomePage.dart';
import 'ValueListenableBuilder.dart';

class Blank {
  int index;
  int value;
  int tmpValue;
  int turn;
  Blank(
      {required this.index,
      required this.value,
      required this.tmpValue,
      required this.turn});
}

class PlayBoard extends StatefulWidget {
  const PlayBoard({super.key});

  @override
  State<PlayBoard> createState() => _PlayBoard();
}

class _PlayBoard extends State<PlayBoard> {
  List<Blank> blankList = [
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
  ];
  int selectedBlank = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 42,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedBlank = index;
              if (blankList[selectedBlank].value != -1) {
                selectedBlank = -1;
              } else {
                HomePage.selectedBlank.value = selectedBlank;
              }
            });
          },
          child: Center(
            child: getInformation(index),
          ),
        );
      },
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget getInformation(int index) {
    int use;
    use = (index / 3).floor();
    if (index % 3 == 0 && use != 12) {
      return Image.asset(
        'assets/score/$use.png',
        fit: BoxFit.fill,
      );
    } else if (index == 36) {
      return const Stack(
        children: [
          Positioned(
            top: 0,
            child: Text(
              'BONUS',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              '+35',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    } else if (index == 37 || index == 38) {
      return Stack(
        children: <Widget>[
          Image.asset('assets/score/blank.png'),
          ValueListenableBuilder4<List<Player>, int, bool, int>(
            first: HomePage.playerScore,
            second: HomePage.player,
            third: HomePage.click,
            fourth: HomePage.selectedBlank,
            // value前面的int代表值的类型，使用时一定明确指定该类型
            builder: (BuildContext context, List<Player> playScore, int player,
                bool click, int selectedBlank, Widget? child) {
              return Center(
                child: Text(
                  "${playScore[(index + 1) % 2].bonus}/63",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: (blankList[index].turn == 0)
                          ? Colors.blue
                          : Colors.red),
                ),
              );
            },
          ),
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          Image.asset('assets/score/blank.png'),
          ValueListenableBuilder4<List<Blank>, int, bool, int>(
            first: HomePage.blankList,
            second: HomePage.player,
            third: HomePage.click,
            fourth: HomePage.selectedBlank,
            // value前面的int代表值的类型，使用时一定明确指定该类型
            builder: (BuildContext context, List<Blank> blankList, int player,
                bool click, int selectedBlank, Widget? child) {
              if (blankList[index].value != -1) {
                return Center(
                  child: Text(
                    "${blankList[index].value}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: (blankList[index].turn == 0)
                          ? Colors.blue
                          : Colors.red,
                    ),
                  ),
                );
              } else if (blankList[index].turn == player) {
                if(blankList[index].tmpValue==-1) {
                  return Center(
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: (index == selectedBlank)
                          ? Colors.amber
                          : Colors.black,
                    ),
                  ),
                );
                }
                return Center(
                  child: Text(
                    "${blankList[index].tmpValue}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: (index == selectedBlank)
                          ? Colors.amber
                          : Colors.black,
                    ),
                  ),
                );
              }
              return const Center();
            },
          ),
        ],
      );
    }
  }
}
