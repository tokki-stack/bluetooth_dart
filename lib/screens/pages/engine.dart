import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_esp32_dust_sensor/utils/T1Colors.dart';
import 'package:flutter_app_esp32_dust_sensor/utils/circular_countdown_timer.dart';
import 'package:flutter_app_esp32_dust_sensor/utils/progress_dialog.dart';
import 'dart:io';

import 'package:nb_utils/nb_utils.dart';

import 'custom.dart';
import 'package:flutter_app_esp32_dust_sensor/utils/global.dart';

class Engine extends StatefulWidget {
  @override
  _Engine createState() => new _Engine();
}

class _Engine extends State<Engine> {
  ProgressDialog pgLogin;
  CountDownController _controller = CountDownController();
  @override
  initState() {
    super.initState();
    init();
  }

  bool _isPause = false;
  Color programColor;
  String programName;
  init() async {
    print('global_currentProgram');

    print(global_currentProgram);
    print('global_duration');

    print(global_duration);
    if (global_duration == null) {
      global_duration = '1';
    }
    getProgram(global_currentProgram);
    if (global_customProgramFlag != true) {
      global_duration = '1';
    }
    if (global_customProgramFlag == true && global_customProgramIndex != 0) {
      await sendRequest(global_currentProgram, true);
    } else {
      _isPause = true;
      Timer(Duration(milliseconds: 10), () => _controller.pause());
    }
  }

  getProgram(String index) {
    if (global_customProgramFlag == true) {
      index = global_customProgram[global_customProgramIndex]['program'];
      global_duration =
          global_customProgram[global_customProgramIndex]['duration'];
    }

    if (index == '1') {
      programName = 'Red Program';
      programColor = Color(0xffea4335);
    } else if (index == '2') {
      programName = 'Blue Program';
      programColor = Color(0xff4285f4);
    } else if (index == '3') {
      programName = 'Green Program';
      programColor = greenColor;
    } else if (index == '4') {
      programName = 'Yellow Program';
      programColor = Color(0xfff08717);
    } else if (index == '5') {
      programName = 'Purple Program';
      programColor = purple;
    } else if (index == '6') {
      programName = 'Turquoise Program';
      programColor = Color(0xff3bcabb);
    } else if (index == '7') {
      programName = 'White Program';
      programColor = grey;
    } else {
      programName = 'Custome Program';
      programColor = redColor;
    }
  }

  sendRequest(String index, bool onOFF) async {
    // try {
    //   if (onOFF) {
    //     if (index == '1') {
    //       global_socket.write("RedOn\n");
    //     } else if (index == '2') {
    //       global_socket.write("BlueOn\n");
    //     } else if (index == '3') {
    //       global_socket.write("GreenOn\n");
    //     } else if (index == '4') {
    //       global_socket.write("YellowOn\n");
    //     } else if (index == '5') {
    //       global_socket.write("PurpleOn\n");
    //     } else if (index == '6') {
    //       global_socket.write("TurquoiseOn\n");
    //     } else {
    //       print('err');
    //     }
    //   } else {
    //     global_socket.write("AllOff\n");
    //   }
    // } catch (e) {
    //   print(e);
    // }

//     String color = '';
//     String onoff = '';
//     String generatedUrl = '';
//     if (index == '1') {
//       color = 'red';
//     } else if (index == '2') {
//       programName = 'Blue Program';
//       color = 'blue';
//     } else if (index == '3') {
//       programName = 'Green Program';
//       color = 'green';
//     } else if (index == '4') {
//       programName = 'Yellow Program';
//       color = 'yellow';
//     } else if (index == '5') {
//       programName = 'Purple Program';
//       color = 'purple';
//     } else if (index == '6') {
//       programName = 'Turquoise Program';
//       color = 'turquoise';
//     } else {
//       programName = 'White Program';
//       color = 'white';
//     }
//     if (onOFF) {
//       onoff = 'on';
//     } else {
//       onoff = 'off';
//     }
//     generatedUrl = 'http://192.168.4.1/' + color + '/' + onoff;
//     print("+++++++++============++++++++++=====+++++========generatedUrl");

//     print(generatedUrl);
//     String encoded = Uri.encodeFull(generatedUrl);
//     print(
//         "+++++++++============++++++++++=====+++++========generatedUrlencoded");

//     print(encoded);
// // 192.168.8.159:80
// // 192.168.4.1
// // 192.168.101.225:3300

//     // var client = new http.Client();
//     // try {
//     //   final response = await client.get(encoded, headers: {
//     //     "Access-Control-Allow-Origin": "*",
//     //   });
//     //   print(response);
//     // } catch (e) {
//     //   print(e);
//     // } finally {
//     //   client.close();
//     // }
//     if (onOFF) {
//       global_socket.write("RedOn\n");
//     } else {
//       global_socket.write("RedOff\n");
//     }
  }

  updateHistory() async {
    final prefs = await SharedPreferences.getInstance();
    global_redHistory = prefs.getString('global_redHistory') ?? '0';
    global_blueHistory = prefs.getString('global_blueHistory') ?? '0';
    global_greenHistory = prefs.getString('global_greenHistory') ?? '0';
    global_yellowHistory = prefs.getString('global_yellowHistory') ?? '0';
    global_purpleHistory = prefs.getString('global_purpleHistory') ?? '0';
    global_turquoiseHistory = prefs.getString('global_turquoiseHistory') ?? '0';
    global_whiteHistory = prefs.getString('global_whiteHistory') ?? '0';

    if (global_currentProgram == '1') {
      global_redHistory =
          (int.parse(global_redHistory) + int.parse(global_duration))
              .toString();
      prefs.setString('global_redHistory', global_redHistory);
    } else if (global_currentProgram == '2') {
      global_blueHistory =
          (int.parse(global_blueHistory) + int.parse(global_duration))
              .toString();
      prefs.setString('global_blueHistory', global_blueHistory);
    } else if (global_currentProgram == '3') {
      global_greenHistory =
          (int.parse(global_greenHistory) + int.parse(global_duration))
              .toString();
      prefs.setString('global_greenHistory', global_greenHistory);
    } else if (global_currentProgram == '4') {
      global_yellowHistory =
          (int.parse(global_yellowHistory) + int.parse(global_duration))
              .toString();
      prefs.setString('global_yellowHistory', global_yellowHistory);
    } else if (global_currentProgram == '5') {
      global_purpleHistory =
          (int.parse(global_purpleHistory) + int.parse(global_duration))
              .toString();
      prefs.setString('global_purpleHistory', global_purpleHistory);
    } else if (global_currentProgram == '6') {
      global_turquoiseHistory =
          (int.parse(global_turquoiseHistory) + int.parse(global_duration))
              .toString();
      prefs.setString('global_turquoiseHistory', global_turquoiseHistory);
    } else if (global_currentProgram == '7') {
      global_whiteHistory =
          (int.parse(global_whiteHistory) + int.parse(global_duration))
              .toString();
      prefs.setString('global_whiteHistory', global_whiteHistory);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    pgLogin = new ProgressDialog(context);
    return new Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // global_customProgramFlag == true
              //     ? Text(
              //         "Custom Program",
              //         style:
              //             TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              //       ).paddingTop(60)
              //     : Container(),
              Text(
                programName,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              ),
              Text('Put your mask on and press play to start')
                  .paddingOnly(top: 20, bottom: 30),
              CircularCountDownTimer(
                // Countdown duration in Seconds
                duration: int.parse(global_duration),
                // Controller to control (i.e Pause, Resume, Restart) the Countdown
                controller: _controller,
                // Width of the Countdown Widget
                width: MediaQuery.of(context).size.width * 0.8,
                // Height of the Countdown Widget
                height: MediaQuery.of(context).size.width * 0.8,
                // Default Color for Countdown Timer
                color: Colors.white,
                // Filling Color for Countdown Timer
                fillColor: programColor,
                // Background Color for Countdown Widget
                backgroundColor: null,
                // Border Thickness of the Countdown Circle
                strokeWidth: 10.0,
                // Begin and end contours with a flat edge and no extension
                strokeCap: StrokeCap.round,
                // Text Style for Countdown Text
                textStyle: TextStyle(
                    fontSize: 50.0,
                    color: programColor,
                    fontWeight: FontWeight.bold),
                // true for reverse countdown (max to 0), false for forward countdown (0 to max)
                isReverse: true,
                // true for reverse animation, false for forward animation
                isReverseAnimation: true,
                // Optional [bool] to hide the [Text] in this widget.
                isTimerTextShown: true,
                // Function which will execute when the Countdown Ends

                onComplete: () async {
                  // Here, do whatever you want
                  print('Countdown Ended');
                  setState(() {
                    _isPause = true;
                  });
                  await sendRequest(global_currentProgram, false);

                  if (global_customProgramFlag == true) {
                    global_currentProgram =
                        global_customProgram[global_customProgramIndex]
                            ['program'];
                    updateHistory();
                    global_customProgramIndex = global_customProgramIndex + 1;
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    print(global_currentProgram);
                    print(global_customProgramIndex);
                    print(global_customProgram.length);
                    if (global_customProgramIndex ==
                        global_customProgram.length) {
                      global_customProgramFlag = false;
                      print("++++++++++++++++++++++++++++++");
                      Future.delayed(const Duration(milliseconds: 100), () {
                        Navigator.pop(context);
                      });
                      return;
                    } else {
                      pgLogin.show();
                      Future.delayed(const Duration(seconds: 3), () {
                        pgLogin.hide();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Engine(),
                          ),
                        );
                      });
                    }
                  } else {
                    updateHistory();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Engine(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: t1_colorPrimary,
          onPressed: () async {
            if (_isPause) {
              setState(() {
                _isPause = false;
              });
              _controller.resume();
              await sendRequest(global_currentProgram, true);
            } else {
              setState(() {
                _isPause = true;
              });
              _controller.pause();
              await sendRequest(global_currentProgram, false);
            }
          },
          icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
          label: Text(_isPause ? "Start" : "Pause")),
    );
  }
}
