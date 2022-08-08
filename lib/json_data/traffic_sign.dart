import 'dart:async';

import 'package:exam/json_data/start_exam_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class traffic extends StatefulWidget {
  const traffic({Key? key}) : super(key: key);

  @override
  State<traffic> createState() => _trafficState();
}

class _trafficState extends State<traffic> {
  int score = 0;
  int i = 0;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    Provider.of<start_exam_pro>(context, listen: false).getmydata1(context);

 }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<start_exam_pro>(
      builder: (context, _exam1, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${score + 1}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "${score + 1}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "${score + 1}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "00:$_start",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Text(
              "Que. ${i+1}",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "${_exam1.listofdata[i]['Question']}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            GestureDetector(
              onTap: () {
                print(111111111111);
                setState(() {
                  _colorContainer=_exam1.listofdata[i]['correctAnswer'] == "0"?Colors.red:Colors.black;
                  i++;
                });
              },
              child: Text(
                "A. ${_exam1.listofdata[i]['option'][0]}",
                style: TextStyle(
                    fontSize: 20,
                    color:_colorContainer),
              ),
            ),
            GestureDetector(
              onTap: () {
                print(2222222222);
                setState(() {


                  _colorContainer=_exam1.listofdata[i]['correctAnswer'] == "1"?Colors.red:Colors.black;
                  i++;
                });
              },
              child: Text(
                "B. ${_exam1.listofdata[i]['option'][1]}",
                style: TextStyle(
                    fontSize: 20,
                    color:_colorContainer),
              ),
            ),
            GestureDetector(
              onTap: () {
                print(333333333);
                    setState(() {
                      _colorContainer=_exam1.listofdata[i]['correctAnswer'] == "2"?Colors.red:Colors.black;
                      i++;
                    });
              },
              child: Text(
                "C. ${_exam1.listofdata[i]['option'][2]}",
                style: TextStyle(
                    fontSize: 20,
                    color:_colorContainer),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _colorContainer = Colors.black;
  Timer? _timer;
  int _start = 30;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    } else {
      _timer = new Timer.periodic(
        const Duration(seconds: 1),
            (Timer timer) => setState(
              () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }
}
