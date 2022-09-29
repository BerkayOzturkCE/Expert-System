import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uzmansistem/Pages/Add/Add.dart';
import 'package:uzmansistem/Pages/QuizPage/TestPage.dart';
import 'package:uzmansistem/Utils/DeviceClass.dart';
import 'package:uzmansistem/Utils/Rules.dart';
import 'package:uzmansistem/Utils/data.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  final _initialization = Firebase.initializeApp();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 25,
        title: Text(
          "ANASAYFA",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 32, 34, 37),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 47, 49, 54),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      usedevicelist = devicelist;
                      HistoryList.clear();
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TestPage()))
                          .whenComplete(() => yenile());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 62, 66, 73),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Başla",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPage()))
                          .then((value) => yenile());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 62, 66, 73),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Kural Ekle",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void yenile() {
    setState(() {});
  }
}
