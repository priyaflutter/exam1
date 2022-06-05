import 'package:exam/multi%20image.dart';
import 'package:exam/multicolor.dart';
import 'package:exam/multiple%20img.dart';
import 'package:exam/postdiffcult.dart';
import 'package:exam/productcustomprice.dart';
import 'package:flutter/material.dart';

class postdiff2 extends StatefulWidget {
  List<ProductList>? productList;
  int index;

  postdiff2(this.productList, this.index);

  @override
  State<postdiff2> createState() => _postdiff2State();
}

class _postdiff2State extends State<postdiff2> {
  bool status = false;
  int index1 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getmuvalue();
  }

  void getmuvalue() {
    for (int i = 0; i < widget.productList!.length; i++) {
      print("${widget.productList![i].pStatus}");
    }
    setState(() {
      status = true;
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

    return status
        ? WillPopScope(
            onWillPop: onback,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Post 22"),
                backgroundColor: Colors.black,
              ),
              body: Container(
                height: bodyheight,
                width: double.infinity,
                padding: EdgeInsets.all(bodyheight * 0.01),
                // decoration: BoxDecoration(border: Border.all(width: 3)),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: bodyheight * 0.17,
                                width: twidth * 0.60,
                                // decoration:
                                //     BoxDecoration(border: Border.all(width: 1)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Id ➛ ",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${widget.productList![widget.index].id}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "p_name : ",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${widget.productList![widget.index].pName}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "s_name : ",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${widget.productList![widget.index].sName}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "p_status : ",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${widget.productList![widget.index].pStatus}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "cat_id : ",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${widget.productList![widget.index].catId}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "is_single : ",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${widget.productList![widget.index].isSingle}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "unit : ",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${widget.productList![widget.index].unit}",
                                          style: TextStyle(
                                              fontSize: bodyheight * 0.02,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: twidth * 0.02,
                            ),
                            Card(color: Colors.grey,
                              child: Card(
                                child: Container(
                                  height: bodyheight * 0.16,
                                  width: twidth * 0.30,
                                  decoration: BoxDecoration(
                                      // border: Border.all(width: 1),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${widget.productList![widget.index].image}"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "weight : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].weight}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "description : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.productList![widget.index].description}",
                            style: TextStyle(
                                fontSize: bodyheight * 0.02,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "created : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].created}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "alert_stock : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].alertStock}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "seller_id : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].sellerId}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "s_lat : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].sLat}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "s_lng : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.productList![widget.index].sLng}",
                            style: TextStyle(
                                fontSize: bodyheight * 0.02,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "total_rating_row : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].totalRatingRow}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "total_rating_count : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].totalRatingCount}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "product_multiple_image : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: bodyheight * 0.05,
                          width: twidth * 0.25,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return multiimage(
                                      widget.productList![widget.index]
                                          .productMultipleImage,
                                      index1,
                                    );
                                  },
                                ));
                              },
                              child: Text("Images")),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "main_color : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].mainColor}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "product_multiple_color : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: bodyheight * 0.05,
                          width: twidth * 0.25,
                          child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return multicolor(
                                          widget.productList![widget.index]
                                              .productMultipleColor,
                                        );
                                      },
                                    ));
                              },
                              child: Text("Color")),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "main_selling_price : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].mainSellingPrice}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "main_mrp : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].mainMrp}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "main_discount : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].mainDiscount}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "product_custom_price : ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        // Container(
                        //   height: bodyheight * 0.05,
                        //   width: twidth * 0.25,
                        //   child: ElevatedButton(
                        //       style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
                        //       onPressed: () {
                        //         Navigator.pushReplacement(context,
                        //             MaterialPageRoute(
                        //               builder: (context) {
                        //                 return coustom(
                        //                   widget.productList![widget.index]
                        //                       .productCustomPrice,
                        //                 );
                        //               },
                        //             ));
                        //       },
                        //       child: Text("Price")),
                        // )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: twidth*0.33,),
                        Text(
                          "success ☞ ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].productCustomPrice![index1].success}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: twidth*0.33,),
                        Text(
                          "u_id ☞ ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].productCustomPrice![index1].uId}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: twidth*0.33,),
                        Text(
                          "product_id ☞ ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].productCustomPrice![index1].productId}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: twidth*0.33,),
                        Text(
                          "selling_price ☞ ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].productCustomPrice![index1].sellingPrice}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: twidth*0.33,),
                        Text(
                          "mrp ☞ ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].productCustomPrice![index1].mrp}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: twidth*0.33,),
                        Text(
                          "discount ☞ ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].productCustomPrice![index1].discount}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: twidth*0.33,),
                        Text(
                          "size ☞ ",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.productList![widget.index].productCustomPrice![index1].size}",
                          style: TextStyle(
                              fontSize: bodyheight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  Future<bool> onback() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return postdiff();
      },
    ));

    return Future.value(true);
  }
}
