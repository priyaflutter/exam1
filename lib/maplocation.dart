import 'dart:ffi';

import 'package:exam/googlemap/google_map.dart';
import 'package:exam/mapscreen.dart';
import 'package:flutter/material.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: TextField(
        controller:a,
        maxLines: 2,
        decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) {

                              return Add_Address_Register_Screen();
                        },));
                      }, icon: Icon(Icons.location_on_outlined))),
      ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: ListTile(title: Text("data"),trailing: IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {

                    return Add_Address_Register_Screen();
                  },));
                },icon: Icon(Icons.location_on_outlined),),)
              ),
            ],
          )),
    );
  }

  TextEditingController a = TextEditingController();
}
