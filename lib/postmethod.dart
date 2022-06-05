import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exam/post2.dart';
import 'package:exam/productapi.dart';
import 'package:flutter/material.dart';

class postttt extends StatefulWidget {
  const postttt({Key? key}) : super(key: key);

  @override
  State<postttt> createState() => _posttttState();
}

class _posttttState extends State<postttt> {
  viewdata? view;
  bool status=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmyvalue();
  }

  Future<void> getmyvalue() async {
    try {
      var dio = Dio();
      var response = await dio.post(
            'https://parcel.cscodetech.com/de_api/dboy_login.php',
          data: {'mobile': 7276465975, 'password': '123'});
      print(response);

      var vv = jsonDecode(response.toString());
      setState(() {
        view = viewdata.fromJson(vv);
        status=true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double tnaviheight = MediaQuery.of(context).padding.bottom;
    double tappbar = kToolbarHeight;

    double bodyheight = theight - tappbar - statusbarheight - tnaviheight;

    return status?Scaffold(
      appBar: AppBar(
        title: Text("Post Method"),
      ),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return post2222();

            },));

        }, label: Text("Next")),
      body: WillPopScope(onWillPop: onback,
        child: Container(
          height: bodyheight,
          width: twidth,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Id : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.id}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "title : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.title}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "status : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.status}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "rate : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.rate}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "lcode : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.lcode}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "full_address : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.fullAddress}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "pincode : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.pincode}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "landmark : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.landmark}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "commission : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.commission}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "bank_name : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.bankName}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "ifsc : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.ifsc}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "receipt_name : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.receiptName}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "acc_number : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.accNumber}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "paypal_id : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.paypalId}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "upi_id : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.upiId}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "email : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.email}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "password : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.password}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "rstatus : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.rstatus}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "mobile : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.mobile}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "accept : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.accept}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "reject : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.reject}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "complete : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.complete}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "dzone : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.dzone}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "vehiid : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.dboydata!.vehiid}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "rimg : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: bodyheight*0.10,
                    width: twidth*0.20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("${view!.dboydata!.rimg}"),fit: BoxFit.cover)),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "ve_img : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: bodyheight*0.10,
                    width: twidth*0.20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("${view!.dboydata!.veImg}"),fit: BoxFit.cover)),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "currency : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.currency}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "ResponseCode : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.responseCode}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Result : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.result}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "ResponseMsg : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.responseMsg}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
        ),
      )):Center(child: CircularProgressIndicator());
  }

  Future<bool> onback() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

        return product();
    },));
    return Future.value(true);
  }
}

class viewdata {
  Dboydata? dboydata;
  String? currency;
  String? responseCode;
  String? result;
  String? responseMsg;

  viewdata(
      {this.dboydata,
      this.currency,
      this.responseCode,
      this.result,
      this.responseMsg});

  viewdata.fromJson(Map<String, dynamic> json) {
    dboydata = json['dboydata'] != null
        ? new Dboydata.fromJson(json['dboydata'])
        : null;
    currency = json['currency'];
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dboydata != null) {
      data['dboydata'] = this.dboydata!.toJson();
    }
    data['currency'] = this.currency;
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    return data;
  }
}

class Dboydata {
  String? id;
  String? title;
  String? rimg;
  String? status;
  String? rate;
  String? lcode;
  String? fullAddress;
  String? pincode;
  String? landmark;
  String? commission;
  String? bankName;
  String? ifsc;
  String? receiptName;
  String? accNumber;
  String? paypalId;
  String? upiId;
  String? email;
  String? password;
  String? rstatus;
  String? mobile;
  String? accept;
  String? reject;
  String? complete;
  String? dzone;
  String? vehiid;
  String? veImg;

  Dboydata(
      {this.id,
      this.title,
      this.rimg,
      this.status,
      this.rate,
      this.lcode,
      this.fullAddress,
      this.pincode,
      this.landmark,
      this.commission,
      this.bankName,
      this.ifsc,
      this.receiptName,
      this.accNumber,
      this.paypalId,
      this.upiId,
      this.email,
      this.password,
      this.rstatus,
      this.mobile,
      this.accept,
      this.reject,
      this.complete,
      this.dzone,
      this.vehiid,
      this.veImg});

  Dboydata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rimg = json['rimg'];
    status = json['status'];
    rate = json['rate'];
    lcode = json['lcode'];
    fullAddress = json['full_address'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    commission = json['commission'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    receiptName = json['receipt_name'];
    accNumber = json['acc_number'];
    paypalId = json['paypal_id'];
    upiId = json['upi_id'];
    email = json['email'];
    password = json['password'];
    rstatus = json['rstatus'];
    mobile = json['mobile'];
    accept = json['accept'];
    reject = json['reject'];
    complete = json['complete'];
    dzone = json['dzone'];
    vehiid = json['vehiid'];
    veImg = json['ve_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rimg'] = this.rimg;
    data['status'] = this.status;
    data['rate'] = this.rate;
    data['lcode'] = this.lcode;
    data['full_address'] = this.fullAddress;
    data['pincode'] = this.pincode;
    data['landmark'] = this.landmark;
    data['commission'] = this.commission;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['receipt_name'] = this.receiptName;
    data['acc_number'] = this.accNumber;
    data['paypal_id'] = this.paypalId;
    data['upi_id'] = this.upiId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['rstatus'] = this.rstatus;
    data['mobile'] = this.mobile;
    data['accept'] = this.accept;
    data['reject'] = this.reject;
    data['complete'] = this.complete;
    data['dzone'] = this.dzone;
    data['vehiid'] = this.vehiid;
    data['ve_img'] = this.veImg;
    return data;
  }
}
