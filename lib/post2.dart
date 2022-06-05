import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exam/invicainfotech.dart';
import 'package:flutter/material.dart';

class post2222 extends StatefulWidget {
  const post2222({Key? key}) : super(key: key);

  @override
  State<post2222> createState() => _post2222State();
}

class _post2222State extends State<post2222> {
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
          'https://test.technofox.co.in/easy-app/api/login',
          data: {'email': "pradosh.son2ic2@gmail.com", 'password': "123456"});
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
        title: Text("Post 22"),
      ),
      body: Container(
        height: bodyheight,
        width: twidth,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Center(
                  child: Text(
                    "success : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "${view!.success}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Id : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.id}",
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
                  "type : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.type}",
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
                  "user_type : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.userType}",
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
                  "name : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.name}",
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
                  "first_name : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.firstName}",
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
                  "last_name : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.lastName}",
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
                  "${view!.data!.email}",
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
                  "country_code : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.countryCode}",
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
                  "phone : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.phone}",
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
                  "otp : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.otp}",
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
                  "is_verified : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.isVerified}",
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
                  "api_token : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    "${view!.data!.apiToken}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "dob : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.dob}",
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
                  "referal_code : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.referalCode}",
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
                  "parent_id : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.parentId}",
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
                  "${view!.data!.status}",
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
                  "created_at : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.createdAt}",
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
                  "updated_at : ",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${view!.data!.updatedAt}",
                  style: TextStyle(
                      fontSize: bodyheight * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(bodyheight*0.03),
              child: Row(
                children: [
                  Text(
                    "message : ",
                    style: TextStyle(
                        fontSize: bodyheight * 0.02, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${view!.message}",
                    style: TextStyle(
                        fontSize: bodyheight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(onPressed: () {
      //
      //       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
      //           return invica();
      //
      //       },));
      //
      // }, label: Text("Next")),
    ):Center(child: CircularProgressIndicator());
  }
}

class viewdata {
  bool? success;
  Data? data;
  String? message;

  viewdata({this.success, this.data, this.message});

  viewdata.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? type;
  String? userType;
  String? name;
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  Null? countryCode;
  String? phone;
  String? otp;
  int? isVerified;
  String? apiToken;
  String? dob;
  String? deviceToken;
  Null? stripeId;
  Null? cardBrand;
  Null? cardLastFour;
  Null? trialEndsAt;
  Null? braintreeId;
  Null? paypalEmail;
  String? referalCode;
  int? parentId;
  bool? status;
  String? createdAt;
  String? updatedAt;

  bool? hasMedia;

  Data({
    this.id,
    this.type,
    this.userType,
    this.name,
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.countryCode,
    this.phone,
    this.otp,
    this.isVerified,
    this.apiToken,
    this.dob,
    this.deviceToken,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.trialEndsAt,
    this.braintreeId,
    this.paypalEmail,
    this.referalCode,
    this.parentId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.hasMedia,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    userType = json['user_type'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    email = json['email'];
    countryCode = json['country_code'];
    phone = json['phone'];
    otp = json['otp'];
    isVerified = json['is_verified'];
    apiToken = json['api_token'];
    dob = json['dob'];
    deviceToken = json['device_token'];
    stripeId = json['stripe_id'];
    cardBrand = json['card_brand'];
    cardLastFour = json['card_last_four'];
    trialEndsAt = json['trial_ends_at'];
    braintreeId = json['braintree_id'];
    paypalEmail = json['paypal_email'];
    referalCode = json['referal_code'];
    parentId = json['parent_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    hasMedia = json['has_media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['is_verified'] = this.isVerified;
    data['api_token'] = this.apiToken;
    data['dob'] = this.dob;
    data['device_token'] = this.deviceToken;
    data['stripe_id'] = this.stripeId;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['braintree_id'] = this.braintreeId;
    data['paypal_email'] = this.paypalEmail;
    data['referal_code'] = this.referalCode;
    data['parent_id'] = this.parentId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    data['has_media'] = this.hasMedia;

    return data;
  }
}
