import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:exam/postmethod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class product extends StatefulWidget {
  const product({Key? key}) : super(key: key);

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  viewdata? view;
  bool status = false;
  int index1=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmyapi();
  }

  Future<void> getmyapi() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');
      print(response);
      var vv = jsonDecode(response.toString());
      view = viewdata.fromJson(vv);
      setState(() {
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Product API"),
        backgroundColor: Colors.black,
      ),
      body: status
          ? Column(
              children: [
                Container(
                  height: bodyheight * 0.95,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: view!.products!.length,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: Container(
                          // height: bodyheight * 0.55,
                          // width: double.infinity,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          margin: EdgeInsets.all(bodyheight * 0.01),
                          padding: EdgeInsets.all(bodyheight * 0.01),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "👩🏽‍💻 Id ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${view!.products![index].id}",
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
                                    "title ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${view!.products![index].title}",
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
                                    "description ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${view!.products![index].description}",
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
                                    "price ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${view!.products![index].price}",
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
                                    "discountPercentage ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${view!.products![index].discountPercentage} %",
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
                                    "rating ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${view!.products![index].rating}",
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
                                    "stock ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${view!.products![index].stock}",
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
                                    "brand ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${view!.products![index].brand}",
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
                                    "category ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${view!.products![index].category}",
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
                                    "images ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Card(
                                    child: Container(
                                      height: bodyheight * 0.10,
                                      width: twidth * 0.20,
                                      decoration: index1==0?BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${view!.products![index].images![index1]}"),
                                              fit: BoxFit.cover)):null,
                                    ),
                                  ),
                                  InkWell(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          showAnimatedDialog(
                                            builder: (context) {
                                              return AlertDialog(
                                                // backgroundColor: Colors.white30,
                                                actions: [
                                                  Container(
                                                    height: bodyheight * 0.50,
                                                    width: double.infinity,
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount:
                                                          2),
                                                      itemCount: view!.products![index].images!.length,
                                                      itemBuilder:
                                                          (context, index1) {
                                                        return Container(
                                                          height:
                                                          bodyheight * 0.10,
                                                          width: twidth * 0.20,
                                                          margin: EdgeInsets.all(bodyheight*0.01),
                                                          decoration: BoxDecoration(
                                                              border:
                                                              Border.all(
                                                                  width: 1),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      "${view!.products![index].images![index1]}"),
                                                                  fit: BoxFit.cover)),
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                            context: context,
                                          );
                                        },
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black))),
                                  ),

                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "thumbnail ⇢ ",
                                    style: TextStyle(
                                        fontSize: bodyheight * 0.02,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Card(
                                    color: Colors.grey,
                                    child: Card(
                                      child: Container(
                                        height: bodyheight * 0.05,
                                        width: twidth * 0.10,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${view!.products![index].thumbnail}"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "total ⇢ ",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${view!.total}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "skip ⇢ ",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${view!.skip}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "limit ⇢ ",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${view!.limit}",
                                style: TextStyle(
                                    fontSize: bodyheight * 0.02,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          : CircularProgressIndicator(
              color: Colors.white,
            ),
    floatingActionButton: FloatingActionButton.extended(onPressed: () {

             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                  return postttt();
             },));

    }, label: Text("Next")),);
  }
}

class viewdata {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  viewdata({this.products, this.total, this.skip, this.limit});

  viewdata.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  dynamic? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
