import 'package:flutter/material.dart';

class getmyprovider with ChangeNotifier {
  List list = List.filled(9, "");
  bool start = false;
  String abc = "";
  String win = "";

  int button = 0;

  void Start() {
    if (button == 1) {
      button = 0;
      abc = "Start";
      notifyListeners();
    } else {
      button = 1;
      abc = "Stop";
      notifyListeners();
    }
  }

  void Restart() {
    list = List.filled(9, "");
    c = "";
    a = 0;
    win = "";
    cnt = 0;
    notifyListeners();
  }

  int a = 0;
  String c = "";
  int cnt = 0;

  void button1() {
    if (a == 0) {
      c = "O";
      a = 1;
      notifyListeners();
    } else {
      c = "x";
      a = 0;
      notifyListeners();
    }
  }

  void box(int i) {
    if (button == 1) {
      if (win == "") {
        if (list[i] == "") {
          button1();
          list[i] = c;
          win1();
          cnt++;
          notifyListeners();
        }
      }
    }
  }

  void win1() {
    if ((list[0] == "O" && list[1] == "O" && list[2] == "O") ||
        (list[3] == "O" && list[4] == "O" && list[5] == "O") ||
        (list[6] == "O" && list[7] == "O" && list[8] == "O") ||
        (list[0] == "O" && list[3] == "O" && list[6] == "O") ||
        (list[1] == "O" && list[4] == "O" && list[7] == "O") ||
        (list[2] == "O" && list[5] == "O" && list[8] == "O") ||
        (list[0] == "O" && list[4] == "O" && list[8] == "O") ||
        (list[2] == "O" && list[4] == "O" && list[6] == "O")) {
      win = "Player 1 win";
    } else if ((list[0] == "X" && list[1] == "X" && list[2] == "X") ||
        (list[3] == "X" && list[4] == "X" && list[5] == "X") ||
        (list[6] == "X" && list[7] == "X" && list[8] == "X") ||
        (list[0] == "X" && list[3] == "X" && list[6] == "X") ||
        (list[1] == "X" && list[4] == "X" && list[7] == "X") ||
        (list[2] == "X" && list[5] == "X" && list[8] == "X") ||
        (list[0] == "X" && list[4] == "X" && list[8] == "X") ||
        (list[2] == "X" && list[4] == "X" && list[6] == "X")) {
      win = "Player 2 win";
    } else if (cnt == 8) {
      win = "Match Draw";
    }
  }
}
