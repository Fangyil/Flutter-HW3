import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yahtzee/HomePage.dart';
import 'package:image_picker/image_picker.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late TextEditingController _controller1, _controller2;
  String click1 = 'click1', click2 = 'click2';

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HISTORY SCORE',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xffb699cc),
      ),
      body: Center(
        child: ValueListenableBuilder<List<Player>>(
          valueListenable: HomePage.playerScore,
          // value前面的int代表值的类型，使用时一定明确指定该类型
          builder:
              (BuildContext context, List<Player> PlayerScore, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: const Text('CHOOSE YOUR PICTURE'),
                              children: <Widget>[
                                SimpleDialogOption(
                                  onPressed: () {
                                    _takePhoto(click1);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: Text('TAKE A PHOTO 📷'),
                                  ),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    _openGallery(click1);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: Text('FROM YOUR ALBUM 🖼️'),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.black, width: 5),
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      child: TextField(
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(7) //限制长度
                        ],
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          border: OutlineInputBorder(
                            ///设置边框四个角的弧度
                            borderRadius: BorderRadius.all(Radius.circular(12)),

                            ///用来配置边框的样式
                            borderSide: BorderSide(
                              ///设置边框的颜色
                              color: Color(0xffDCDEE3),

                              ///设置边框的粗细
                              width: 7,
                            ),
                          ),
                        ),
                        controller: _controller1
                          ..text = HomePage.playerScore.value[0].name,
                        onSubmitted: (String value) async {
                          await showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              if (value == '') {
                                value = HomePage.playerScore.value[0].name;
                                return AlertDialog(
                                  title: const Text('Wrong!'),
                                  content:
                                      const Text('You cannot input nothing.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              }
                              HomePage.playerScore.value[0].name = value;
                              return AlertDialog(
                                title: const Text('Thanks!'),
                                content:
                                    Text('You changed the name to "$value".'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 35),
                    const Text(
                      'WIN',
                      style: TextStyle(fontSize: 20, color: Color(0xff6c589d)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50), // 圆角半径
                      child: Container(
                        height: 75,
                        width: 150,
                        color: const Color(0xff6c589d),
                        child: Center(
                          child: Text(
                            '${PlayerScore[0].win}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Color(0xfff4ebfe),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'TIE',
                      style: TextStyle(fontSize: 20, color: Color(0xff6c589d)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50), // 圆角半径
                      child: Container(
                        height: 75,
                        width: 150,
                        color: const Color(0xff6c589d),
                        child: Center(
                          child: Text(
                            '${PlayerScore[0].tie}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Color(0xfff4ebfe),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'LOSE',
                      style: TextStyle(fontSize: 20, color: Color(0xff6c589d)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50), // 圆角半径
                      child: Container(
                        height: 75,
                        width: 150,
                        color: const Color(0xff6c589d),
                        child: Center(
                          child: Text(
                            '${PlayerScore[0].lose}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Color(0xfff4ebfe),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: const Text('CHOOSE YOUR PICTURE'),
                              children: <Widget>[
                                SimpleDialogOption(
                                  onPressed: () {
                                    _takePhoto(click2);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: Text('TAKE A PHOTO 📷'),
                                  ),
                                ),
                                SimpleDialogOption(
                                  onPressed: () {
                                    _openGallery(click2);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: Text('FROM YOUR ALBUM 🖼️'),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.black, width: 5),
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      child: TextField(
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(7) //限制长度
                        ],
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                          border: OutlineInputBorder(
                            ///设置边框四个角的弧度
                            borderRadius: BorderRadius.all(Radius.circular(12)),

                            ///用来配置边框的样式
                            borderSide: BorderSide(
                              ///设置边框的颜色
                              color: Color(0xffDCDEE3),

                              ///设置边框的粗细
                              width: 7,
                            ),
                          ),
                        ),
                        controller: _controller2
                          ..text = HomePage.playerScore.value[1].name,
                        onSubmitted: (String value) async {
                          await showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              if (value == '') {
                                value = HomePage.playerScore.value[1].name;
                                return AlertDialog(
                                  title: const Text('Wrong!'),
                                  content:
                                      const Text('You cannot input nothing.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              }
                              HomePage.playerScore.value[1].name = value;
                              return AlertDialog(
                                title: const Text('Thanks!'),
                                content:
                                    Text('You changed the name to "$value".'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 35),
                    const Text(
                      'WIN',
                      style: TextStyle(fontSize: 20, color: Color(0xff6c589d)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50), // 圆角半径
                      child: Container(
                        height: 75,
                        width: 150,
                        color: const Color(0xff6c589d),
                        child: Center(
                          child: Text(
                            '${PlayerScore[1].win}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Color(0xfff4ebfe),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'TIE',
                      style: TextStyle(fontSize: 20, color: Color(0xff6c589d)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50), // 圆角半径
                      child: Container(
                        height: 75,
                        width: 150,
                        color: const Color(0xff6c589d),
                        child: Center(
                          child: Text(
                            '${PlayerScore[1].tie}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Color(0xfff4ebfe),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'LOSE',
                      style: TextStyle(fontSize: 20, color: Color(0xff6c589d)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50), // 圆角半径
                      child: Container(
                        height: 75,
                        width: 150,
                        color: const Color(0xff6c589d),
                        child: Center(
                          child: Text(
                            '${PlayerScore[1].lose}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48,
                              color: Color(0xfff4ebfe),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }

  _takePhoto(String a) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        if (a == 'click1') {
          HomePage.playerScore.value[0].image = File(image.path).path;
        } else if (a == 'click2') {
          HomePage.playerScore.value[1].image = File(image.path).path;
        }
        Navigator.of(context).pop();
      }
    });
  }

  /*相册*/
  _openGallery(String a) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        if (a == 'click1') {
          HomePage.playerScore.value[0].image = File(image.path).path;
        } else if (a == 'click2') {
          HomePage.playerScore.value[1].image = File(image.path).path;
        }
        Navigator.of(context).pop();
      }
    });
  }
}
