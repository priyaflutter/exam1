
import 'package:exam/rto_data/model.dart';
import 'package:exam/rto_data/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class rc_info extends StatefulWidget {
  const rc_info({Key? key}) : super(key: key);

  @override
  State<rc_info> createState() => _rc_infoState();
}

class _rc_infoState extends State<rc_info> {
  List<rto_model> searchlist = [];

  bool issearch=false;

  TextEditingController search = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<rto_data>(context, listen: false).getmydata(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<rto_data>(
      builder: (context, _rto, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text("RTO MAP"),
              bottom: PreferredSize(
                  preferredSize: Size(100, 40),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xfff6f6f6),
                    ),
                    child: TextField(
                      onChanged: (value) {

                        setState(() {

                          print("value=====${value}");
                          if (value.isNotEmpty) {
                            print("=====object");
                            searchlist = [];
                            for (int i = 0; i <_rto.list1.length; i++) {
                              print("1111111111");
                              if(_rto.list1[i].name.toString().toLowerCase().contains(value.toString().toLowerCase()))
                              {
                                print("list==========${_rto.list1[i].name}");
                                print("22222222222");
                                searchlist.add(_rto.list1[i]);
                                print("search==========${searchlist}");
                              }

                              print("33333333333333");
                            }
                          }
                          else{
                            setState(() {
                              print("44444444444");
                              searchlist=_rto.list1;
                            });
                          }
                        });

                      },
                      controller: search,
                      enabled: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: IconButton(onPressed: () {
                                    setState(() {
                                      issearch=false;
                                    });
                          }, icon: Icon(Icons.search_rounded,
                            color: Colors.grey,)),
                          hintText: "Search",
                          hintStyle: TextStyle()),
                    ),
                  )),
            ),
            body: _rto.status
                ? ListView.builder(
                    itemCount:_rto.list1.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final rto=issearch?searchlist[index]:_rto.list1[index];
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(10),
                              height: 60,
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              decoration:
                                  BoxDecoration(color: Colors.deepOrange),
                              child: Text(
                                "${rto.name}",
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                              child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _rto.list1[index].detail!.length,
                            itemBuilder: (context, index1) {
                              return Container(
                                  margin: EdgeInsets.all(10),
                                  height: 60,
                                  width: 100,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400),
                                  child: Text(
                                    "${_rto.list1[index].detail![index1].cityName}",
                                    style: TextStyle(fontSize: 15),
                                  ));
                            },
                          )),
                        ],
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()));
      },
    );
  }

}
