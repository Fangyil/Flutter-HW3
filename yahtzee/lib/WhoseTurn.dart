import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ValueListenableBuilder.dart';

class WhoseTurn extends StatefulWidget {
  const WhoseTurn({super.key});

  @override
  State<WhoseTurn> createState() => _WhoseTurnState();
}

class _WhoseTurnState extends State<WhoseTurn> {
  bool move1 = true;
  bool move2 = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 245,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Stack(
          children: [
            Container(
              color: const Color(0xff613a80),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SizedBox(
                  height: 58,
                  width: 75,
                  child: Stack(
                    children: [
                      ValueListenableBuilder3<List<Player>, int, int>(
                          first: HomePage.playerScore,
                          second: HomePage.round,
                          third: HomePage.player,
                          // value前面的int代表值的类型，使用时一定明确指定该类型
                          builder: (BuildContext context,
                              List<Player> playerScore,
                              int round,
                              int player,
                              Widget? child) {
                          if (player == 0) {
                            return Opacity(
                              opacity: 0.8,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(10), // 圆角半径
                                  child:
                                      Container(color: const Color(0xffe9d8ce)),
                                ),
                              ),
                            );
                          }
                          return const Center();
                        }, valueListenable: HomePage.playerScore,
                      ),
                      Positioned(
                        right: (move1) ? 14 : 10,
                        child: ValueListenableBuilder3<List<Player>, int, int>(
                          first: HomePage.playerScore,
                          second: HomePage.round,
                          third: HomePage.player,
                          // value前面的int代表值的类型，使用时一定明确指定该类型
                          builder: (BuildContext context,
                              List<Player> playerScore,
                              int round,
                              int player,
                              Widget? child) {
                            if (playerScore[0].score > 100) {
                              move1 = false;
                            }
                            return (playerScore[0].score < 10)
                                ? Text(
                                    '0${playerScore[0].score}',
                                    style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    '${playerScore[0].score}',
                                    style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                          },
                          valueListenable: HomePage.playerScore,
                        ),
                      ),
                      ValueListenableBuilder3<List<Player>, int, int>(
                          first: HomePage.playerScore,
                          second: HomePage.round,
                          third: HomePage.player,
                          // value前面的int代表值的类型，使用时一定明确指定该类型
                          builder: (BuildContext context,
                              List<Player> playerScore,
                              int round,
                              int player,
                              Widget? child) {
                          return Positioned(
                            bottom: 4,
                            right: 32.0 - 2 * playerScore[0].name.length,
                            child: Text(
                              playerScore[0].name,
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        },
                        valueListenable: HomePage.playerScore,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 50,
                  width: 62,
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 3,
                        left: 5,
                        child: Text(
                          'ROUND',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: ValueListenableBuilder3<List<Player>, int, int>(
                          first: HomePage.playerScore,
                          second: HomePage.round,
                          third: HomePage.player,
                          // value前面的int代表值的类型，使用时一定明确指定该类型
                          builder: (BuildContext context,
                              List<Player> playerScore,
                              int round,
                              int player,
                              Widget? child) {
                            if (round < 10) {
                              return Text(
                                "0$round/13",
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                              );
                            }
                            return Text(
                              "$round/13",
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            );
                          }, valueListenable: HomePage.playerScore,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 58,
                  width: 75,
                  child: Stack(
                    children: [
                      ValueListenableBuilder3<List<Player>, int, int>(
                          first: HomePage.playerScore,
                          second: HomePage.round,
                          third: HomePage.player,
                          // value前面的int代表值的类型，使用时一定明确指定该类型
                          builder: (BuildContext context,
                              List<Player> playerScore,
                              int round,
                              int player,
                              Widget? child) {
                          if (player == 1) {
                            return Opacity(
                              opacity: 0.8,
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(10), // 圆角半径
                                  child:
                                      Container(color: const Color(0xffe9d8ce)),
                                ),
                              ),
                            );
                          }
                          return const Center();
                        }, valueListenable: HomePage.playerScore,
                      ),
                      Positioned(
                        right: (move2) ? 15 : 11,
                        child: ValueListenableBuilder3<List<Player>, int, int>(
                          first: HomePage.playerScore,
                          second: HomePage.round,
                          third: HomePage.player,
                          // value前面的int代表值的类型，使用时一定明确指定该类型
                          builder: (BuildContext context,
                              List<Player> playerScore,
                              int round,
                              int player,
                              Widget? child) {
                            if (playerScore[1].score > 100) {
                              move2 = false;
                            }
                            if (playerScore[1].score < 10) {
                              return Text(
                                '0${playerScore[1].score}',
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                            return Text(
                              '${playerScore[1].score}',
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                          valueListenable: HomePage.playerScore,
                        ),
                      ),
                      ValueListenableBuilder3<List<Player>, int, int>(
                          first: HomePage.playerScore,
                          second: HomePage.round,
                          third: HomePage.player,
                          // value前面的int代表值的类型，使用时一定明确指定该类型
                          builder: (BuildContext context,
                              List<Player> playerScore,
                              int round,
                              int player,
                              Widget? child) {
                          return Positioned(
                            bottom: 4,
                            right: 31.0 - 2 * playerScore[1].name.length,
                            child: Text(
                              playerScore[1].name,
                              style: const TextStyle(fontSize: 14),
                            ),
                          );
                        }, valueListenable: HomePage.playerScore,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
