import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uzmansistem/Pages/QuizPage/HistoryPage.dart';
import 'package:uzmansistem/Pages/QuizPage/ShowDevice.dart';
import 'package:uzmansistem/Pages/QuizPage/ShowRules.dart';
import 'package:uzmansistem/Pages/ResultPage/FailedPage.dart';
import 'package:uzmansistem/Pages/ResultPage/FoundPage.dart';
import 'package:uzmansistem/Utils/DeviceClass.dart';
import 'package:uzmansistem/Utils/Rules.dart';
import 'package:uzmansistem/Utils/data.dart';
import 'package:uzmansistem/Widgets/widgets.dart';

class TestPage extends StatefulWidget {
  int sayac = 1;
  bool sorukontrol = true;
  bool kontrol = true;
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool? selected = null;
  MaterialColor yesColor = Colors.grey;
  MaterialColor noColor = Colors.grey;
  Color? noBackColor = Colors.white;
  Color? yesBackColor = Colors.white;
  Color yesIconColor = Colors.white;
  Color noIconColor = Colors.white;
  late Rules activeRule;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _initialization = Firebase.initializeApp();

  void soru() {
    try {
      if (useRuleslist.length == 1) {
        activeRule = Ruleslist[0];
        return;
      }
      if (widget.sorukontrol == true) {
        widget.sorukontrol = false;
        var rndm = new Random();
        int i = rndm.nextInt(useRuleslist.length);
        print(
            useRuleslist.length.toString() + "-" + Ruleslist.length.toString());
        activeRule = useRuleslist[i];
      }
    } catch (e) {
      WarningWidget(e.toString() + " Hatası Alındı", "Hata", context);
    }
  }

  void yenile() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.kontrol == true) {
      Veri_Al().whenComplete(() => {
            widget.kontrol = false,
            yenile(),
          });
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 47, 49, 54),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      soru();
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              //widget.sorukontrol = true;
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            iconSize: 35,
          ),
          title: Text(
            "Soru " + widget.sayac.toString(),
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
              icon: Icon(
                Icons.history,
                color: Colors.white,
                size: 35,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 32, 34, 37),
        ),
        backgroundColor: Color.fromARGB(255, 47, 49, 54),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 62, 66, 73),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              height: 300,
              width: 350,
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    activeRule.Rule,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: Colors.white,
                    height: 2,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = true;
                        yesBackColor = Colors.green[50];
                        yesColor = Colors.green;
                        yesIconColor = Colors.green;
                        noBackColor = Colors.white;
                        noColor = Colors.grey;
                        noIconColor = Colors.white;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: yesColor),
                          borderRadius: BorderRadius.circular(15),
                          color: yesBackColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Evet",
                            style: TextStyle(color: yesColor, fontSize: 25),
                          ),
                          Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: yesColor),
                            ),
                            child: Icon(
                              Icons.done,
                              color: yesIconColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = false;
                        noBackColor = Colors.green[50];
                        noColor = Colors.green;
                        noIconColor = Colors.green;
                        yesBackColor = Colors.white;
                        yesColor = Colors.grey;
                        yesIconColor = Colors.white;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: noColor),
                          borderRadius: BorderRadius.circular(15),
                          color: noBackColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hayır",
                            style: TextStyle(color: noColor, fontSize: 25),
                          ),
                          Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: noColor),
                            ),
                            child: Icon(
                              Icons.done,
                              color: noIconColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (selected != null) {
                Rules history = new Rules();
                history.Rule = activeRule.Rule;

                if (selected == true) {
                  history.answer = "Evet";
                  DeleteDevice();
                  DeleteRule();
                } else {
                  history.answer = "Hayır";
                }
                HistoryList.add(history);

                Control();
                if (useRuleslist.length > 1) {
                  useRuleslist.remove(activeRule);
                }
                widget.sayac++;
                selected = null;
                noBackColor = Colors.white;
                noColor = Colors.grey;
                noIconColor = Colors.white;
                yesBackColor = Colors.white;
                yesColor = Colors.grey;
                yesIconColor = Colors.white;
                widget.sorukontrol = true;
                setState(() {});
              } else {
                WarningWidget("Bir seçeneği işaretleyin", "Uyarı", context);
              }
            },
            child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 62, 66, 73),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "İleri",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowDevice()));
                },
                child: Container(
                  width: 170,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 62, 66, 73),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Kalan cihazlar",
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowRule()));
                },
                child: Container(
                  width: 170,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 62, 66, 73),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Kalan Kurallar",
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      );
    }
  }

  void DeleteDevice() {
    List<Device> listdevicetemp = [];
    for (int i = 0; i < activeRule.device.length; i++) {
      for (int j = 0; j < usedevicelist.length; j++) {
        if (activeRule.device[i].Name == usedevicelist[j].Name) {
          Device devicetemp = new Device();
          devicetemp = usedevicelist[j];
          listdevicetemp.add(devicetemp);
        }
      }
    }
    usedevicelist = listdevicetemp;
  }

  void DeleteRule() {
    List<Rules> listRuletemp = [];
    bool cntrl = false;

    for (int j = 0; j < useRuleslist.length; j++) {
      for (int k = 0; k < useRuleslist[j].device.length; k++) {
        for (int i = 0; i < usedevicelist.length; i++) {
          if (usedevicelist[i].Name == useRuleslist[j].device[k].Name) {
            Rules Ruletemp = new Rules();
            Ruletemp = useRuleslist[j];
            listRuletemp.add(Ruletemp);
            cntrl = true;
            break;
          }
        }
        if (cntrl == true) {
          cntrl = false;
          break;
        }
      }
    }
    useRuleslist = listRuletemp;
  }

  void Control() {
    if (usedevicelist.length == 1) {
      Navigator.popAndPushNamed(context, "/Found");
    } else if (useRuleslist.length == 1) {
      Navigator.popAndPushNamed(context, "/NotFound");
    }
  }

  Future Veri_Al() async {
    if (widget.kontrol == true) {
      Ruleslist.clear();
      var veriler = await _firestore.collection("Rules").get();
      for (var veri in veriler.docs) {
        Rules data = new Rules();
        data.Id = veri.get("Id").toString();
        data.Rule = veri.get("Rule").toString();

        var veriler2 = await _firestore
            .collection("Rules")
            .doc(data.Id)
            .collection("Device")
            .get();
        for (var veri2 in veriler2.docs) {
          Device Subdata = new Device();
          Subdata.Name = veri2.get("Name").toString();
          data.device.add(Subdata);
        }
        Ruleslist.add(data);
      }

      useRuleslist = Ruleslist;
    }
  }
}
