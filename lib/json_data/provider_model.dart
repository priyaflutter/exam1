import 'dart:convert';

import 'package:exam/json_data/english_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

class examquestion extends ChangeNotifier{



  bool status = false;
  int index1 = 0;
  english_model? getexamdata;

  getmydata(BuildContext context) async {
    var jsondata = await rootBundle.loadString('asset/english.json');
    // var jsondata="asset/english.json";
    var parsedjson = jsonDecode(jsondata);
      print("decodeeee");
      getexamdata = english_model.fromJson(parsedjson);
      status = true;
      notifyListeners();
      print("okkkkkkkkkkk");

    print("==============${parsedjson.runtimeType} : $parsedjson");
  }


}