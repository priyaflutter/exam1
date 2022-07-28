import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'interview2.dart';

class interview extends StatefulWidget {
  const interview({Key? key}) : super(key: key);

  @override
  State<interview> createState() => _interviewState();
}

class _interviewState extends State<interview> {

  Database? db;
  List list=[];
  viewdata? view;
  List<Map> mm=[];

  @override
  void initState() {
    super.initState();
    getvalue();
    datahelper();

  }

  Future<void> getvalue() async {

    try {
      var response = await Dio().get('https://dummyjson.com/products');
      print(response);
      var vv=jsonDecode(response.toString());
       view=viewdata.fromJson(vv);
      for(int i=0;i<view!.products!.length;i++)
        {
             list.add(view!.products![i].id);
        }
      
                print(list);
    } catch (e) {
      print(e);
    }
  }

  datahelper(){
    
        // print(list);

    dbhelper().getdatabase().then((value){

        setState(() {
          db=value ;
        });


    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: ElevatedButton(onPressed: () {
                  int ii =0;
                  String title ="";
                  print(list.length);


               for(int i =0;i<list.length;i++)
                 {
                         setState(() {
                           ii = list[i];
                           title = list[i];
                         });
                         print('-----$ii');
                         dbhelper().insertdata(ii,db!,title);
                 }

                  dbhelper().insertdata(ii,db!,title);

               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {

                      return interview222();
               },));




      }, child: Text("Import")),
    ),);
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


class dbhelper{

 Future<Database> getdatabase() async {



    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');


    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'create table demo (id integer primary key autoincrement, iid int, title Text)');
        });

        return database;

    }

 Future<void> insertdata(int ii, Database database, String title1) async {


      String insert="Insert into demo(iid,title) values('$ii','$title1')";

     int cnt= await database.rawInsert(insert);
             print("cnt====$cnt");
 }

 Future<List<Map>> viewdattaaa(Database database) async {

    String viewqry="select * from demo";
   List<Map> map=await database.rawQuery(viewqry);
      return map;

  }



  }



