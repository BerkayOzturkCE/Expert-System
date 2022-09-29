import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzmansistem/Utils/DeviceClass.dart';
import 'package:uzmansistem/Utils/data.dart';
import 'package:uzmansistem/Widgets/widgets.dart';
import 'package:uzmansistem/main.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();

  List<Device> Adddevices = [];
}

class _AddPageState extends State<AddPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  double width = 200.0;
  double widthIcon = 200.0;
  String mail = "";
  var controltxtfld = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.Adddevices = devicelist;
    return Page();
  }

  Widget Page() {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left),
            iconSize: 40,
            color: Colors.white,
          ),
          centerTitle: true,
          titleSpacing: 25,
          title: Text(
            "Kural Ekle",
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
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: [
            Add(),
          ],
        ));
  }

  Widget Add() {
    bool oku = false;
    return Container(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, right: 30, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controltxtfld,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (String s) {
                      mail = s;
                    },
                    readOnly: oku,
                    decoration: InputDecoration(
                      hintText: "Kural",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.all(20),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Cihazlar",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children:
                        widget.Adddevices.map((Device) => ListDevice(Device))
                            .toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      ekle();
                    },
                    child: Container(
                      width: 500,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 62, 66, 73),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Kaydet",
                          style: TextStyle(
                            fontSize: 25,
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
                ],
              ),
            ),
          ],
        ));
  }

  Widget ListDevice(Device device) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    device.isActive = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(10),
          width: 400,
          height: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 62, 66, 73),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 250,
                child: Text(
                  device.Name,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Checkbox(
                value: device.isActive,
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                onChanged: (value) {
                  device.isActive = value!;
                  setState(() {});
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> ekle() async {
    // ignore: await_only_futures
    try {
      if (mail == "") {
        WarningWidget("Lütfen boş yerleri doldurun!", "Hata", context);
        return;
      }

      DocumentReference ref =
          FirebaseFirestore.instance.collection("Rules").doc();
      String Id;
      Map<String, dynamic> eklenecek = Map();
      eklenecek["Rule"] = mail;

      Id = ref.id;
      eklenecek["Id"] = Id;

      ref.set(eklenecek);
      int sayac = 0;
      for (int i = 0; i < widget.Adddevices.length; i++) {
        if (widget.Adddevices[i].isActive == true) {
          sayac++;
          DocumentReference ref2 = FirebaseFirestore.instance
              .collection("Rules")
              .doc(Id)
              .collection("Device")
              .doc(sayac.toString());
          Map<String, dynamic> eklenecek2 = Map();
          eklenecek2["Name"] = widget.Adddevices[i].Name;

          ref2.set(eklenecek2);
        }
      }

      mail = "";
      controltxtfld.text = "";
      for (int k = 0; k < widget.Adddevices.length; k++) {
        widget.Adddevices[k].isActive = false;
      }
      setState(() {});

      WarningWidget("Başarıyla kaydedildi", "Başarılı", context);
    } catch (error) {
      WarningWidget(error.toString(), "Hata", context);
    }
  }
}
