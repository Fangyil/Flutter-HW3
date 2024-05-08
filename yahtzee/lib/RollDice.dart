import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'PlayBoard.dart';
import 'dart:math';

class Dice {
  int index;
  int point;
  bool selectState;
  int selectTime;
  Dice({
    required this.index,
    required this.point,
    required this.selectState,
    required this.selectTime,
  });
}

class Point {
  int point;
  int times;
  Point({required this.point, required this.times});
}

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  static List<Dice> diceList = [
    Dice(index: 1, point: 0, selectState: false, selectTime: -1),
    Dice(index: 2, point: 0, selectState: false, selectTime: -1),
    Dice(index: 3, point: 0, selectState: false, selectTime: -1),
    Dice(index: 4, point: 0, selectState: false, selectTime: -1),
    Dice(index: 5, point: 0, selectState: false, selectTime: -1),
  ];
  static List<Point> pointList = [
    Point(point: 1, times: 0),
    Point(point: 2, times: 0),
    Point(point: 3, times: 0),
    Point(point: 4, times: 0),
    Point(point: 5, times: 0),
    Point(point: 6, times: 0),
  ];
  static List<Blank> blankList = [
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
  static List<Player> playerScore = [
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
  ];
  int player = 0;
  int round = 0;
  static int _times = 3;
  int tmp = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < diceList.length; i++)
              DiceStyle(
                diceIndex: diceList[i].point,
                select: diceList[i].index,
                times: _times,
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_times == 0) {
                  null;
                } else {
                  setState(
                    () {
                      //dice points
                      HomePage.click.value = !HomePage.click.value;
                      for (var i = 0; i < diceList.length; i++) {
                        if (!diceList[i].selectState) {
                          if (_times != 3) {
                            pointList[diceList[i].point].times--;
                          }
                          diceList[i].point = Random().nextInt(6);
                          pointList[diceList[i].point].times++;
                        }
                      }
                      //score
                      for (var i = player + 1; i < blankList.length; i += 3) {
                        if (i ~/ 3 == 0 ||
                            i ~/ 3 == 2 ||
                            i ~/ 3 == 4 ||
                            i ~/ 3 == 6 ||
                            i ~/ 3 == 8 ||
                            i ~/ 3 == 10) {
                          blankList[i].tmpValue =
                              pointList[i ~/ 6].point * pointList[i ~/ 6].times;
                        }
                      }
                      for (var i = 0; i < pointList.length; i++) {
                        if (pointList[i].times >= 3) {
                          tmp = diceList[0].point +
                              diceList[1].point +
                              diceList[2].point +
                              diceList[3].point +
                              diceList[4].point +
                              5;
                          if (player == 0) {
                            blankList[4].tmpValue = tmp;
                          } else {
                            blankList[5].tmpValue = tmp;
                          }
                          if (pointList[0].times == 2 ||
                              pointList[1].times == 2 ||
                              pointList[2].times == 2 ||
                              pointList[3].times == 2 ||
                              pointList[4].times == 2 ||
                              pointList[5].times == 2) {
                            if (player == 0) {
                              blankList[16].tmpValue = 25;
                            } else {
                              blankList[17].tmpValue = 25;
                            }
                          }
                        }
                        if (pointList[i].times >= 4) {
                          tmp = diceList[0].point +
                              diceList[1].point +
                              diceList[2].point +
                              diceList[3].point +
                              diceList[4].point +
                              5;
                          if (player == 0) {
                            blankList[10].tmpValue = tmp;
                          } else {
                            blankList[11].tmpValue = tmp;
                          }
                        }
                        if (pointList[i].times == 5) {
                          if (blankList[34].value == -1 ||
                              blankList[35].value == -1) {
                            if (player == 0) {
                              blankList[34].tmpValue = 50;
                            } else {
                              blankList[35].tmpValue = 50;
                            }
                          } else {
                            if (player == 0) {
                              blankList[34].value += 100;
                            } else {
                              blankList[35].value += 100;
                            }
                          }
                        }
                      }
                      if ((pointList[0].times > 0 &&
                              pointList[1].times > 0 &&
                              pointList[2].times > 0 &&
                              pointList[3].times > 0) ||
                          (pointList[1].times > 0 &&
                              pointList[2].times > 0 &&
                              pointList[3].times > 0 &&
                              pointList[4].times > 0) ||
                          (pointList[2].times > 0 &&
                              pointList[3].times > 0 &&
                              pointList[4].times > 0 &&
                              pointList[5].times > 0)) {
                        if (player == 0) {
                          blankList[22].tmpValue = 30;
                        } else {
                          blankList[23].tmpValue = 30;
                        }
                      }
                      if ((pointList[0].times == pointList[1].times &&
                              pointList[1].times == pointList[2].times &&
                              pointList[2].times == pointList[3].times &&
                              pointList[3].times == pointList[4].times &&
                              pointList[0].times == 1) ||
                          (pointList[5].times == pointList[1].times &&
                              pointList[1].times == pointList[2].times &&
                              pointList[2].times == pointList[3].times &&
                              pointList[3].times == pointList[4].times &&
                              pointList[5].times == 1)) {
                        if (player == 0) {
                          blankList[28].tmpValue = 40;
                        } else {
                          blankList[29].tmpValue = 40;
                        }
                      }
                      tmp = diceList[0].point +
                          diceList[1].point +
                          diceList[2].point +
                          diceList[3].point +
                          diceList[4].point +
                          5;
                      if (player == 0) {
                        blankList[40].tmpValue = tmp;
                      } else {
                        blankList[41].tmpValue = tmp;
                      }
                      HomePage.blankList.value = blankList;
                      _times--;
                      HomePage.click.value = !HomePage.click.value;
                      for (var i = 0; i < diceList.length; i++) {
                        if (diceList[i].selectState) {
                          diceList[i].selectTime = _times+1;
                        }
                      }
                    },
                  );
                }
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    width: 1.7,
                    color: (_times != 0)
                        ? const Color(0xff000000)
                        : const Color(0xffffffff),
                  ),
                ), //边框
                shape: MaterialStateProperty.all(BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(11))), //圆角弧度
              ),
              child: Text('ROLL  $_times'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (HomePage.selectedBlank.value == -1 || _times == 3) {
                  null;
                } else {
                  setState(
                    () {
                      HomePage.click.value = false;
                      player = (player + 1) % 2;
                      if (player == 0) {
                        round += 1;
                      }
                      _times = 3;
                      HomePage.round.value = round;
                      HomePage.player.value = player;
                      if (blankList[HomePage.selectedBlank.value].tmpValue ==
                          -1) {
                        blankList[HomePage.selectedBlank.value].tmpValue = 0;
                      }
                      blankList[HomePage.selectedBlank.value].value =
                          blankList[HomePage.selectedBlank.value].tmpValue;
                      playerScore[(player + 1) % 2].score +=
                          blankList[HomePage.selectedBlank.value].tmpValue;
                      if (HomePage.selectedBlank.value == 1 ||
                          HomePage.selectedBlank.value == 7 ||
                          HomePage.selectedBlank.value == 13 ||
                          HomePage.selectedBlank.value == 19 ||
                          HomePage.selectedBlank.value == 25 ||
                          HomePage.selectedBlank.value == 31) {
                        playerScore[0].bonus +=
                            blankList[HomePage.selectedBlank.value].value;
                      } else if (HomePage.selectedBlank.value == 2 ||
                          HomePage.selectedBlank.value == 8 ||
                          HomePage.selectedBlank.value == 14 ||
                          HomePage.selectedBlank.value == 20 ||
                          HomePage.selectedBlank.value == 26 ||
                          HomePage.selectedBlank.value == 32) {
                        playerScore[1].bonus +=
                            blankList[HomePage.selectedBlank.value].value;
                      }
                      if (playerScore[0].bonus > 62) {
                        playerScore[0].score += 35;
                      } else if (playerScore[1].bonus > 62) {
                        playerScore[1].score += 35;
                      }
                      for (var i = 0; i < diceList.length; i++) {
                        diceList[i].point = 0;
                        diceList[i].selectState = false;
                        diceList[i].selectTime = -1;
                      }
                      for (var i = player + 1; i < blankList.length; i += 3) {
                        blankList[i].tmpValue = -1;
                      }
                      for (var i = 0; i < pointList.length; i++) {
                        pointList[i].times = 0;
                      }
                      HomePage.selectedBlank.value = -1;
                      HomePage.playerScore.value = playerScore;
                    },
                  );
                }
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    width: 1.7,
                    color: (_times != 3)
                        ? const Color(0xff000000)
                        : const Color(0xffffffff),
                  ),
                ), //边框
                shape: MaterialStateProperty.all(BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(11))), //圆角弧度
              ),
              child: const Text('PLAY'),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

class DiceStyle extends StatefulWidget {
  DiceStyle({
    super.key,
    required this.diceIndex,
    required this.select,
    required this.times,
  });
  final int diceIndex;
  final int select;
  final int times;

  @override
  State<DiceStyle> createState() => _DiceStyleState();
}

class _DiceStyleState extends State<DiceStyle> {
  final _diceEmojis = [
    '⚀',
    '⚁',
    '⚂',
    '⚃',
    '⚄',
    '⚅',
  ];

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          if (widget.times != 3 &&
              _RollDiceState.diceList[widget.select - 1].selectTime == -1) {
            _RollDiceState.diceList[widget.select - 1].selectState =
                !_RollDiceState.diceList[widget.select - 1].selectState;
          }
        });
      },
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 85.0),
      ),
      child: Text(
        _diceEmojis[widget.diceIndex],
        style: TextStyle(
          color: (_RollDiceState.diceList[widget.select - 1].selectState)
              ? Colors.purpleAccent
              : Colors.deepPurple,
        ),
      ),
    );
  }
}
