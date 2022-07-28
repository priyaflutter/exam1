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
          child: Container(
            height: 100,
            width: double.infinity,
            child: TextField(
        controller:_address_Controller,
        maxLines: 2,
        decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) {

                          return Add_Address_Register_Screen();
                    },));
                  }, icon: Icon(Icons.location_on_outlined))),
      ),
          )),
    );
  }

  TextEditingController _address_Controller = TextEditingController();
}
