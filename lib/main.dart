import 'package:flutter/material.dart';
// import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_esp32_dust_sensor/screens/splash.dart';
import 'dart:io';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await AndroidAlarmManager.initialize();
  // try {
  //   Socket sock = await Socket.connect('192.168.4.1', 80);
  //   global_socket = sock;
  // } catch (e) {
  //   print(e);
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venus Mask',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Nunito'),
      home: Splash(),
    );
  }
}

// import 'package:flutter/foundation.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';

// void main() async {
//   // modify with your true address/port
//   Socket sock = await Socket.connect('192.168.4.1', 80);
//   runApp(MyApp(sock));
// }

// class MyApp extends StatelessWidget {
//   Socket socket;

//   MyApp(Socket s) {
//     this.socket = s;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final title = 'TcpSocket Demo';
//     return MaterialApp(
//       title: title,
//       home: MyHomePage(
//         title: title,
//         channel: socket,
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final String title;
//   final Socket channel;

//   MyHomePage({Key key, @required this.title, @required this.channel})
//       : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Container(
//             child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                 child: Text("Red On",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: _redOn,
//               ),
//               RaisedButton(
//                 child: Text("Blue On",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: _blueOn,
//               ),
//               RaisedButton(
//                 child: Text("Green On",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: _greenOn,
//               ),
//               RaisedButton(
//                 child: Text("Yellow On",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: _yellowOn,
//               ),
//               RaisedButton(
//                 child: Text("Purple On",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: _purpleOn,
//               ),
//               RaisedButton(
//                 child: Text("Turquoise On",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: _turquoiseOn,
//               ),
//               RaisedButton(
//                 child: Text("White On",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: _whiteOn,
//               ),
//               RaisedButton(
//                 child: Text("Off",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontStyle: FontStyle.italic,
//                         fontSize: 20.0)),
//                 color: Colors.red,
//                 onPressed: _allOff,
//               ),
//             ],
//           ),
//         )));
//   }

//   void _redOn() {
//     widget.channel.write("RedOn\n");
//   }

//   void _blueOn() {
//     widget.channel.write("BlueOn\n");
//   }

//   void _greenOn() {
//     widget.channel.write("GreenOn\n");
//   }

//   void _yellowOn() {
//     widget.channel.write("YellowOn\n");
//   }

//   void _purpleOn() {
//     widget.channel.write("PurpleOn\n");
//   }

//   void _turquoiseOn() {
//     widget.channel.write("TurquoiseOn\n");
//   }

//   void _whiteOn() {
//     widget.channel.write("WhiteOn\n");
//   }

//   void _allOff() {
//     widget.channel.write("AllOff\n");
//   }

//   @override
//   void dispose() {
//     widget.channel.close();
//     super.dispose();
//   }
// }
