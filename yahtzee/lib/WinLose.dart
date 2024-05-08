import 'dart:io';
import 'package:flutter/material.dart';
import 'package:yahtzee/HomePage.dart';

class WinLose extends StatefulWidget {
  const WinLose({super.key});

  @override
  State<WinLose> createState() => _WinLose();
}

class _WinLose extends State<WinLose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<List<Player>>(
          valueListenable: HomePage.playerScore,
          // value前面的int代表值的类型，使用时一定明确指定该类型
          builder:
              (BuildContext context, List<Player> PlayerScore, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (PlayerScore[0].score < PlayerScore[1].score)
                              ? 125
                              : 150,
                          height: (PlayerScore[0].score < PlayerScore[1].score)
                              ? 125
                              : 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color:
                                  (PlayerScore[0].score < PlayerScore[1].score)
                                      ? Colors.black
                                      : const Color.fromARGB(255, 245, 185, 7),
                              width:
                                  (PlayerScore[0].score < PlayerScore[1].score)
                                      ? 5
                                      : 7,
                            ),
                            // 圆角边框
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: (PlayerScore[0].image == '')
                                    ? const AssetImage('assets/bear.png')
                                    : FileImage(File(PlayerScore[0].image))
                                        as ImageProvider,
                                fit: BoxFit.cover),
                          ),
                        ),
                        if (PlayerScore[0].score >= PlayerScore[1].score)
                          Text(
                            PlayerScore[0].name,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff212974)),
                          ),
                        if (PlayerScore[0].score < PlayerScore[1].score)
                          Text(
                            PlayerScore[0].name,
                            style: const TextStyle(
                                fontSize: 30, color: Color(0xff212974)),
                          ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50), // 圆角半径
                          child: Container(
                            height: 75,
                            width: 150,
                            color: const Color(0xffbcb0e0),
                            child: Center(
                              child: Text(
                                '${PlayerScore[0].score}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                  color: Color(0xff56309f),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (PlayerScore[1].score < PlayerScore[0].score)
                              ? 125
                              : 150,
                          height: (PlayerScore[1].score < PlayerScore[0].score)
                              ? 125
                              : 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color:
                                  (PlayerScore[1].score < PlayerScore[0].score)
                                      ? Colors.black
                                      : const Color.fromARGB(255, 245, 185, 7),
                              width:
                                  (PlayerScore[1].score < PlayerScore[0].score)
                                      ? 5
                                      : 7,
                            ),
                            // 圆角边框
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: (PlayerScore[1].image == '')
                                    ? const AssetImage('assets/bear.png')
                                    : FileImage(File(PlayerScore[1].image))
                                        as ImageProvider,
                                fit: BoxFit.cover),
                          ),
                        ),
                        if (PlayerScore[1].score >= PlayerScore[0].score)
                          Text(
                            PlayerScore[1].name,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff212974)),
                          ),
                        if (PlayerScore[1].score < PlayerScore[0].score)
                          Text(
                            PlayerScore[1].name,
                            style: const TextStyle(
                                fontSize: 30, color: Color(0xff212974)),
                          ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50), // 圆角半径
                          child: Container(
                            height: 75,
                            width: 150,
                            color: const Color(0xffbcb0e0),
                            child: Center(
                              child: Text(
                                '${PlayerScore[1].score}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 48,
                                  color: Color(0xff56309f),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 30),
                if (PlayerScore[0].score > PlayerScore[1].score)
                  Text(
                    PlayerScore[0].name,
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 245, 185, 7),
                    ),
                  )
                else if (PlayerScore[0].score < PlayerScore[1].score)
                  Text(
                    PlayerScore[1].name,
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 245, 185, 7),
                    ),
                  )
                else
                  const Text(
                    'BOTH',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 245, 185, 7),
                    ),
                  ),
                const Text(
                  'win the game!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.refresh_outlined,
                    size: 60,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "REPLAY",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      //輸贏
                      if (PlayerScore[0].score > PlayerScore[1].score) {
                        HomePage.playerScore.value[0].win += 1;
                        HomePage.playerScore.value[1].lose += 1;
                      } else if (PlayerScore[0].score < PlayerScore[1].score) {
                        HomePage.playerScore.value[1].win += 1;
                        HomePage.playerScore.value[0].lose += 1;
                      } else if (PlayerScore[0].score == PlayerScore[1].score) {
                        HomePage.playerScore.value[0].tie += 1;
                        HomePage.playerScore.value[1].tie += 1;
                      }
                      for (var i = 0;
                          i < HomePage.blankList.value.length;
                          i++) {
                        HomePage.blankList.value[i].value = -1;
                        HomePage.blankList.value[i].tmpValue = -1;
                      }
                      for (var i = 0;
                          i < HomePage.playerScore.value.length;
                          i++) {
                        PlayerScore[i].bonus = 0;
                        PlayerScore[i].score = 0;
                      }
                      HomePage.selectedBlank.value = -1;
                      // HomePage.player.value = 0;
                      HomePage.click.value = false;
                      if (PlayerScore[0].score == 0) HomePage.round.value = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff581f92),
                    shadowColor: Colors.black,
                    minimumSize: const Size(250, 70),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.home,
                    size: 60,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "HOME",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (PlayerScore[0].score > PlayerScore[1].score) {
                        HomePage.playerScore.value[0].win += 1;
                        HomePage.playerScore.value[1].lose += 1;
                      } else if (PlayerScore[0].score < PlayerScore[1].score) {
                        HomePage.playerScore.value[1].win += 1;
                        HomePage.playerScore.value[0].lose += 1;
                      } else if (PlayerScore[0].score == PlayerScore[1].score) {
                        HomePage.playerScore.value[0].tie += 1;
                        HomePage.playerScore.value[1].tie += 1;
                      }
                      for (var i = 0;
                          i < HomePage.blankList.value.length;
                          i++) {
                        HomePage.blankList.value[i].value = -1;
                        HomePage.blankList.value[i].tmpValue = -1;
                      }
                      for (var i = 0;
                          i < HomePage.playerScore.value.length;
                          i++) {
                        HomePage.playerScore.value[i].bonus = 0;
                        HomePage.playerScore.value[i].score = 0;
                      }
                      HomePage.click.value = false;
                      HomePage.round.value = 0;
                      HomePage.selectedBlank.value = -1;
                      HomePage.player.value = 0;
                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff581f92),
                    shadowColor: Colors.black,
                    minimumSize: const Size(250, 70),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
