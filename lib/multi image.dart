import 'package:exam/posrdiff2.dart';
import 'package:exam/postdiffcult.dart';
import 'package:flutter/material.dart';

class multiimage extends StatefulWidget {
  List<ProductMultipleImage>? productMultipleImage;
  int index1;

  multiimage(this.productMultipleImage, this.index1);

  @override
  State<multiimage> createState() => _multiimageState();
}

class _multiimageState extends State<multiimage> {
  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < widget.productMultipleImage!.length; i++) {
      print("111=================${widget.productMultipleImage![i].id}");
      setState(() {
        status = true;
      });
    }

    print(
        "222=================${widget.productMultipleImage![widget.index1].success}");
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
                  title: Text("Product Multiple Image"),
                  backgroundColor: Colors.black,
                ),
                body: ListView.builder(
                  itemCount: widget.productMultipleImage!.length,
                  itemBuilder: (context, index) {
                    return Container(
                        height: bodyheight * 0.20,
                        width: twidth,
                        margin: EdgeInsets.all(bodyheight * 0.01),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Row(
                          children: [
                            Card(
                              color: Colors.grey,
                              child: Card(
                                child: Container(
                                  height: bodyheight * 0.10,
                                  width: twidth * 0.20,
                                  // margin: EdgeInsets.all(bodyheight * 0.02),
                                  decoration: BoxDecoration(
                                      // border: Border.all(width: 1),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${widget.productMultipleImage![index].productImage}"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: twidth * 0.10,
                            ),
                            Container(
                              height: bodyheight * 0.20,
                              width: twidth * 0.50,
                              padding: EdgeInsets.only(
                                  top: bodyheight * 0.03,
                                  bottom: bodyheight * 0.03),
                              // decoration: BoxDecoration(border: Border.all(width: 1)),
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
                                        "${widget.productMultipleImage![index].success}",
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
                                        "id : ",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.03,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${widget.productMultipleImage![index].id}",
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
                                        "${widget.productMultipleImage![index].productId}",
                                        style: TextStyle(
                                            fontSize: bodyheight * 0.03,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
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
