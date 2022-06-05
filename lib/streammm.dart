// Stream is State Managment Tool
// Whwre two Proccesed Strem And  Sink
import 'dart:async';
import 'dart:convert';

import 'package:exam/productapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class mystremm extends StatefulWidget {
  const mystremm({Key? key}) : super(key: key);

  @override
  State<mystremm> createState() => _mystremmState();
}

class _mystremmState extends State<mystremm> {
  StreamController<String> mm = StreamController<String>();

  List vv=[];
  viewdata? view;

  @override
  void initState() {
    super.initState();
    getdata();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton:FloatingActionButton(onPressed: () {
        product();
      },),
      body: StreamBuilder(
        stream: mm.stream,
        builder: (context, snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting)
          {
            print("===================object");

             return Center(child: CircularProgressIndicator());

          }

            print("================Data");
            // return Text("${snapshot.data.toString()}");
          return ListView.builder(
             itemCount:mm.sink.toString().length,
            itemBuilder:(context, index) {
                  print("Containerrrrrrrrrrrrrrrrrrrrrrr");
                  return Container(height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: Column(children: [
                    Text("${00}")
                  ],),);
          },);
            

        },
      ),
    );
  }

  getdata() async {
    var url = Uri.parse('https://fakestoreapi.com/products?limit=5');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    vv=jsonDecode(response.toString());
    for(int i=0;i<vv.length;i++)
      {
         view=viewdata.fromJson(vv[i]);

      }
       mm.sink.add(response.body.toString());
    print("legth=========${mm.sink.toString().length}");


  }
}

class viewdata {
  int? userId;
  int? id;
  String? title;
  String? body;

  viewdata({this.userId, this.id, this.title, this.body});

  viewdata.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

