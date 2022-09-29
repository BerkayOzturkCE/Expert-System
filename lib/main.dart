import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzmansistem/Pages/Add/Add.dart';
import 'package:uzmansistem/Pages/MainMenu/MainMenu.dart';
import 'package:uzmansistem/Pages/ResultPage/FailedPage.dart';
import 'package:uzmansistem/Pages/ResultPage/FoundPage.dart';
import 'package:uzmansistem/Utils/data.dart';

import 'Utils/DeviceClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: App(),
      routes: <String, WidgetBuilder>{
        '/NotFound': (BuildContext context) => new NotFoundPage(),
        '/Found': (BuildContext context) => new FoundPage(),
      },
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  List<Device> devices = [];

  @override
  Widget build(BuildContext context) {
    addDevice();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Hata();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Menu();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Wait();
      },
    );
  }

  void addDevice() {
    Device device = new Device();
    device.Name = "Anakart";
    device.Image =
        "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/Anakart.jpg?alt=media&token=8c428d18-0fab-468b-8374-b239fd96268d";
    devices.add(device);

    Device device2 = new Device();
    device2.Name = "Cpu";
    device2.Image =
        "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/Cpu.jpeg?alt=media&token=2cc410be-645f-43d2-9e06-60ba9194a7f3";

    devices.add(device2);

    Device device3 = new Device();
    device3.Name = "Gpu";
    device3.Image =
        "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/Gpu.jpeg?alt=media&token=dcefbdd6-ea84-4dc5-be23-79f68f066b17";

    devices.add(device3);

    Device device4 = new Device();
    device4.Name = "Ram";
    device4.Image =
        "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/Ram.jpg?alt=media&token=304778e0-80fb-46c6-991b-14c3252e6038";

    devices.add(device4);

    Device device5 = new Device();
    device5.Name = "Psu";
    device5.Image =
        "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/Psu.jpg?alt=media&token=9ec79c01-6d7a-416f-b998-fd86005761f4";

    devices.add(device5);

    Device device6 = new Device();
    device6.Name = "Monitör";
    device6.Image =
        "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/Monitor.jpg?alt=media&token=da5f6ac7-b5ac-450d-8db2-376b3338aa8b";

    devices.add(device6);

    Device device7 = new Device();
    device7.Name = "Hoparlör";
    device7.Image =
        "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/hoparlor.jpg?alt=media&token=e106957d-b1de-43d3-a56b-f4e0cd4a6dcd";

    devices.add(device7);

    Device device8 = new Device();
    device8.Name = "Hdd";
    device8.Image =
        "https://firebasestorage.googleapis.com/v0/b/expertsystem-7c788.appspot.com/o/Hdd.jpg?alt=media&token=7222715d-34a3-4e61-9fff-768b5c412649";

    devices.add(device8);
    devicelist = devices;
  }
}

class Hata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Bağlantı hatası",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Wait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
