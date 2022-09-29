import 'package:flutter/material.dart';
import 'package:uzmansistem/Utils/DeviceClass.dart';
import 'package:uzmansistem/Utils/Rules.dart';
import 'package:uzmansistem/Utils/data.dart';

class ShowRule extends StatefulWidget {
  @override
  _ShowRuleState createState() => _ShowRuleState();
}

class _ShowRuleState extends State<ShowRule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 25,
        elevation: 0,
        centerTitle: false,
        title: Text("Kurallar"),
        foregroundColor: Colors.white,
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 32, 34, 37),
      ),
      backgroundColor: Color.fromARGB(255, 47, 49, 54),
      body: ListView(
        children: useRuleslist.map((Rule) => ListItem(Rule)).toList(),
      ),
    );
  }

  Widget ListItem(Rules rules) {
    return Column(
      children: [
        ListTile(
            tileColor: Color.fromARGB(255, 62, 66, 73),
            title: Text(
              rules.Rule,
              style: TextStyle(color: Colors.white),
            ),
            leading: CircleAvatar(child: Text(rules.Rule[0]))),
        Divider(
          color: Colors.white,
          height: 0,
        ),
      ],
    );
  }
}
