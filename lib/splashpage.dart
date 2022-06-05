import 'package:exam/postdiffcult.dart';
import 'package:exam/postmethod.dart';
import 'package:exam/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  static SharedPreferences? pref;

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool login = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    login1();
  }

  login1() async {
    
      splash.pref =await SharedPreferences.getInstance();


     Future.delayed(Duration(seconds: 10)).then((value) {

       if (login) {
         print("loginnnnnnnnnnnnnn");
         Navigator.pushReplacement(context, MaterialPageRoute(
           builder: (context) {
             return postdiff();
           },
         ));

       } else {
         print("notttttttttttt");


         Navigator.pushReplacement(context, MaterialPageRoute(
           builder: (context) {
             return register();
           },
         ));


       }
     });

  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double tnaviheight = MediaQuery.of(context).padding.bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - tappbar - statusbarheight - tnaviheight;

    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Container(
        height: bodyheight*0.50,
        width: twidth*0.50,
        decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/register.gif"), fit: BoxFit.fill)),
      ),
          )),
    );
  }
}
