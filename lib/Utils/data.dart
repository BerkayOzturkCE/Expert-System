import 'package:flutter/material.dart';
import 'package:uzmansistem/Utils/Rules.dart';

import 'DeviceClass.dart';

List<Device> devicelist = [];
List<Rules> Ruleslist = [];
List<Rules> HistoryList = [];

List<Device> usedevicelist = [];
List<Rules> useRuleslist = [];

class ScreenUtil {
  static getSize(context) {
    return MediaQuery.of(context).size;
  }

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static minimumSize(context) {
    double enkucuk = getWidth(context);
    if (getWidth(context) > getHeight(context)) {
      enkucuk = getHeight(context);
    }
    return enkucuk;
  }
}
