import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class start_exam_pro extends ChangeNotifier{
  
bool status = false;
  Map? map;
  List listofdata=[];

  getmydata1(BuildContext context) async {
    var jsondata = await rootBundle.loadString('asset/english.json');
    // var jsondata="asset/english.json";
    var parsedjson = jsonDecode(jsondata);
    map = parsedjson as Map;
    print("decodeeee");
     listofdata=map!['data'];
     listofdata.shuffle();
    notifyListeners();
    print("okkkkkkkkkkk");

    print("==============${listofdata[0]['Question']}");
  }


}