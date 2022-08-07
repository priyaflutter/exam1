import 'dart:convert';

import 'package:exam/json_data/json_.dart';
import 'package:exam/json_data/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class exam_preparation extends StatefulWidget {
  const exam_preparation({Key? key}) : super(key: key);

  @override
  State<exam_preparation> createState() => _exam_preparationState();
}

class _exam_preparationState extends State<exam_preparation> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<examquestion>(context,listen: false).getmydata(context);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exam Preparation"),),
    body: Consumer<examquestion>(builder: (context, _exampreparation, child) {
      return Column(
        children: [
          Container(
            height: 400,
            width: 700,
            child: Text(""),),
        ],
      );
    },));
  }
}
