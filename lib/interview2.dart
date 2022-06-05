import 'package:exam/interview.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class interview222 extends StatefulWidget {
  const interview222({Key? key}) : super(key: key);

  @override
  State<interview222> createState() => _interview222State();
}

class _interview222State extends State<interview222> {

  Database? db;
  List<Map> mm=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      getalldata();
  }

  void getalldata() {

    dbhelper().getdatabase().then((value) {

        setState(() {
          db=value;
        });

     dbhelper().viewdattaaa(db!).then((listofmap) {

       setState(() {
         mm=listofmap;
       });
     });
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ListView.builder(
      itemCount:mm.length,
      itemBuilder: (context, index) {

          return ListTile(title: Text("${mm[index]['iid']}"),subtitle: Text("${mm[index]['title']}"),);

    },)),);
  }


}
