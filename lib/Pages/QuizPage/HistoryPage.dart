import 'package:flutter/material.dart';
import 'package:uzmansistem/Utils/Rules.dart';
import 'package:uzmansistem/Utils/data.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int sayac = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 25,
        elevation: 0,
        centerTitle: false,
        title: Text("Cevaplar"),
        foregroundColor: Colors.white,
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 32, 34, 37),
      ),
      backgroundColor: Color.fromARGB(255, 47, 49, 54),
      body: ListView(
        children: HistoryList.map((item) => ListItem(item)).toList(),
      ),
    );
  }

  Widget ListItem(Rules rule) {
    sayac++;
    return Column(
      children: [
        ListTile(
            tileColor: Color.fromARGB(255, 62, 66, 73),
            title: Text(
              rule.Rule,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "Cevap=> " + rule.answer,
              style: TextStyle(color: Colors.white),
            ),
            leading: CircleAvatar(child: Text(sayac.toString()))),
        Divider(
          color: Colors.white,
          height: 0,
        ),
      ],
    );
  }
}
