
import 'package:exam/json_data/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class english extends StatefulWidget {
  const english({Key? key}) : super(key: key);

  @override
  State<english> createState() => _englishState();
}

class _englishState extends State<english> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<examquestion>(context, listen: false).getmydata(context);
  }

  @override
  Widget build(BuildContext context) {

    return  Consumer<examquestion>(builder: (context, _exam, child) {
        return _exam.status?ListView.builder(
          itemCount:_exam.getexamdata!.data!.length,
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Que.${index + 1}  "),
                      Expanded(
                          flex: 2,
                          child:
                          Text("${_exam.getexamdata!.data![index].question}")),
                    ],
                  ),
                  Image.network("${_exam.getexamdata!.data![index].imageUrl}"),
                  Row(
                    children: [
                      Text("Ans. "),
                      Expanded(
                          flex: 2,
                          child: Text("${_exam.getexamdata!.data![index].answer}"))
                      // Expanded(
                      //   flex: 2,
                      //   child: _english!.data![index].correctAnswer == "0"
                      //       ? Text("${_english!.data![index].option![0]}")
                      //       : _english!.data![index].correctAnswer == "1"
                      //           ? Text(
                      //               "${_english!.data![index].option![1]}")
                      //           : _english!.data![index].correctAnswer ==
                      //                   "2"
                      //               ? Text(
                      //                   "${_english!.data![index].option![2]}")
                      //               : Text(""),
                      // )
                    ],
                  ),
                ],
              ),
            );
          },
        ):Center(child: CircularProgressIndicator());
    },);
  }

  // english_model? _english;
  // bool status = false;
  // int index1 = 0;
  //
  // Future<void> getmydata() async {
  //   var jsondata = await rootBundle.loadString('asset/english.json');
  //   // var jsondata="asset/english.json";
  //   var parsedjson = jsonDecode(jsondata);
  //   print("decodeeee");
  //   setState(() {
  //     _english = english_model.fromJson(parsedjson);
  //     status = true;
  //     print("okkkkkkkkkkk");
  //   });
  //
  //   print("==============${parsedjson.runtimeType} : $parsedjson");
  // }
}
