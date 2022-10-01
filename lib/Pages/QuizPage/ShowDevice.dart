import 'package:flutter/material.dart';
import 'package:uzmansistem/Utils/DeviceClass.dart';
import 'package:uzmansistem/Utils/data.dart';

class ShowDevice extends StatefulWidget {
  const ShowDevice({Key? key}) : super(key: key);

  @override
  _ShowDeviceState createState() => _ShowDeviceState();
}

class _ShowDeviceState extends State<ShowDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 25,
        elevation: 0,
        centerTitle: false,
        title: Text("Cihazlar"),
        foregroundColor: Colors.white,
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 32, 34, 37),
      ),
      backgroundColor: Color.fromARGB(255, 47, 49, 54),
      body: ListView(
        children: usedevicelist.map((Device) => ListItem(Device)).toList(),
      ),
    );
  }

  Widget ListItem(Device device) {
    return Column(
      children: [
        ListTile(
            tileColor: Color.fromARGB(255, 62, 66, 73),
            title: Text(
              device.Name,
              style: TextStyle(color: Colors.white),
            ),
            leading: CircleAvatar(child: Text(device.Name[0]))),
        Divider(
          color: Colors.white,
          height: 0,
        ),
        SizedBox(
          height: 0,
          width: 0,
        )
      ],
    );
  }
}
