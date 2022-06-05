import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class invicainfo extends StatefulWidget {
  const invicainfo({Key? key}) : super(key: key);

  @override
  State<invicainfo> createState() => _invicainfoState();
}

class _invicainfoState extends State<invicainfo> {
  viewdata? view;
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmyvalue();
  }

  Future<void> getmyvalue() async {
    try {
      var response =
          await Dio().get('https://invicainfotech.com/apicall/mydata');
      print(response);
      var vv = jsonDecode(response.toString());
      setState(() {
        view = viewdata.fromJson(vv);
        status = true;
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

    return status
        ? Scaffold(
            appBar: AppBar(
              title: Text("Invica Infotech"),
              backgroundColor: Colors.black,
            ),
            body: ListView.builder(
              itemCount: view!.contacts!.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: bodyheight * 0.20,
                                  width: twidth * 0.30,
                                  margin: EdgeInsets.all(bodyheight * 0.02),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${view!.contacts![index].userimage}"),
                                          fit: BoxFit.cover)),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Id : ",
                                      style: TextStyle(
                                          fontSize: bodyheight * 0.02,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${view!.contacts![index].id}",
                                      style: TextStyle(
                                          fontSize: bodyheight * 0.02,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: bodyheight * 0.20,
                              width: twidth * 0.50,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "name : ",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${view!.contacts![index].name}",
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
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${view!.contacts![index].email}",
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
                                        "address : ",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${view!.contacts![index].address}",
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
                                        "gender : ",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Male",
                                        style: view!.contacts![index].gender=="male"?TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue):null
                                      ),
                                      Text("/"),
                                      Text(
                                          "Female",
                                          style: view!.contacts![index].gender=="female"?TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue):null
                                      ),

                                    ],
                                  ),
                                  // RichText(
                                  //     text: TextSpan(children: [
                                  //       TextSpan(
                                  //       text: "Male",
                                  //       style: view!.contacts![index].gender ==
                                  //               "male"
                                  //           ? TextStyle(color: Colors.blue)
                                  //           : null) ,
                                  //       TextSpan(text: '/'),
                                  //       TextSpan(
                                  //           text: "Female",
                                  //           style: view!.contacts![index].gender ==
                                  //               "female"
                                  //               ? TextStyle(color: Colors.blue)
                                  //               : null) ,
                                  // ],style: TextStyle(color: Colors.black))),
                                  Row(
                                    children: [
                                      Text(
                                        "phone : ",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "",
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
                                        "\t\t\t\t\t mobile : ",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${view!.contacts![index].phone!.mobile}",
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
                                        "\t\t\t\t\t home : ",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${view!.contacts![index].phone!.home}",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              view!.contacts!.removeAt(index);
                            });
                          },
                          child: Container(
                            height: bodyheight * 0.08,
                            width: twidth,
                            margin: EdgeInsets.only(
                                bottom: bodyheight * 0.01,
                                top: bodyheight * 0.01),
                            decoration: BoxDecoration(color: Colors.red),
                            child: Center(
                                child: Text(
                              "Remove",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

class viewdata {
  List<Contacts>? contacts;

  viewdata({this.contacts});

  viewdata.fromJson(Map<String, dynamic> json) {
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  String? id;
  String? name;
  String? email;
  String? userimage;
  String? address;
  String? gender;
  Phone? phone;

  Contacts(
      {this.id,
      this.name,
      this.email,
      this.userimage,
      this.address,
      this.gender,
      this.phone});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userimage = json['userimage'];
    address = json['address'];
    gender = json['gender'];
    phone = json['phone'] != null ? new Phone.fromJson(json['phone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['userimage'] = this.userimage;
    data['address'] = this.address;
    data['gender'] = this.gender;
    if (this.phone != null) {
      data['phone'] = this.phone!.toJson();
    }
    return data;
  }
}

class Phone {
  String? mobile;
  String? home;

  Phone({this.mobile, this.home});

  Phone.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    home = json['home'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['home'] = this.home;
    return data;
  }
}
