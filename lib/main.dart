import 'package:exam/class.dart';
import 'package:exam/googlemap/google_map.dart';
import 'package:exam/googlemap/location_provider.dart';
import 'package:exam/json_data/provider_model.dart';
import 'package:exam/json_data/tabbar_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'json_data/start_exam_pro.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationProvider>(create: (context) => LocationProvider(),),
        ChangeNotifierProvider<examquestion>(create: (context) => examquestion()),
        ChangeNotifierProvider<start_exam_pro>(create: (context) =>start_exam_pro()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: tabbar(),
      )));
}

//Todo product();

class exam extends StatefulWidget {
  const exam({Key? key}) : super(key: key);

  @override
  State<exam> createState() => _examState();
}

class _examState extends State<exam> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: TextField(
                onTap: () {},
                controller: a,
                decoration: InputDecoration(
                    labelText: "Enter Value",
                    errorText: status ? model().s : null),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (a.text.isEmpty) {
                      status = true;
                    } else {
                      status = false;
                    }
                  });

                  showModalBottomSheet(
                    builder: (context) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              width: 20,
                              margin: EdgeInsets.all(5),
                              decoration:
                                  BoxDecoration(border: Border.all(width: 2)),
                            );
                          },
                        ),
                      );
                    },
                    context: context,
                  );
                },
                child: Text("Submit")),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2),
                            image: DecorationImage(
                                image: AssetImage("images/p${index + 1}.jpg"),
                                fit: BoxFit.cover)),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  TextEditingController a = TextEditingController();
}
