import 'package:exam/postdiffcult.dart';
import 'package:flutter/material.dart';

class coustom extends StatefulWidget {

  List<ProductCustomPrice>? productCustomPrice;
  coustom(this.productCustomPrice);



  @override
  State<coustom> createState() => _coustomState();
}

class _coustomState extends State<coustom> {

  bool status=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      status=true;
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
            title: Text("Product Multiple Color"),
            backgroundColor: Colors.black,
          ),
          body: ListView.builder(
            itemCount: widget.productCustomPrice!.length,
            itemBuilder: (context, index) {
              return Expanded(
                child: Container(
                    // height: bodyheight * 0.18,
                    // width: twidth,
                    margin: EdgeInsets.all(bodyheight * 0.01),
                    padding: EdgeInsets.all(bodyheight * 0.01),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "success : ",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].success}",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "u_id : ",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].uId}",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "product_id : ",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].productId}",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "selling_price : ",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].sellingPrice}",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "mrp : ",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].mrp}",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "discount : ",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].discount}",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "size : ",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.productCustomPrice![index].size}",
                              style: TextStyle(
                                  fontSize: bodyheight * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                      ],
                    )),
              );
            },
          )),
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
