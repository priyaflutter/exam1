import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exam/rto_data/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

class rto_data extends ChangeNotifier{



  bool status = false;
  List<rto_model> list1=[];

  getmydata(BuildContext context) async {

      var jsondata = await rootBundle.loadString('asset/RTO.json');
        List list = jsonDecode(jsondata);
      print("decodeeee");
      for(int i=0;i<list.length;i++)
        {

          rto_model view=rto_model.fromJson(list[i]);
          list1.add(view);
          status = true;
          notifyListeners();
        }

      notifyListeners();
      print("okkkkkkkkkkk");

  }


}