import 'package:exam/json_data/json_.dart';
import 'package:exam/json_data/rc_infromation.dart';
import 'package:exam/json_data/traffic_sign.dart';
import 'package:flutter/material.dart';

class tabbar extends StatefulWidget {
  const tabbar({Key? key}) : super(key: key);

  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Question Bank"),
          centerTitle: true,
          actions: [
          ],
          bottom:PreferredSize(child: ColoredBox(color: Colors.deepOrange,child: _tabBar,), preferredSize: _tabBar.preferredSize)
          // TabBar(
          //
          //     indicator: BoxDecoration(
          //         color: Colors.grey.shade700,
          //         borderRadius: BorderRadius.all(Radius.circular(10))),
          //     tabs: <Widget>[
          //       Tab(
          //         text: "NEW",
          //       ),
          //       Tab(
          //         text: "COMPLETED",
          //       ),
          //     ]),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return rc_info();
              },));
        },),
        body: Column(
          children: [
            // Container(
            //   height:30,
            //   decoration: BoxDecoration(color: Colors.grey),
            //   width: double.infinity,
            //   child: TabBar(
            //       indicator: BoxDecoration(
            //           color: Colors.grey.shade700,
            //           borderRadius: BorderRadius.all(Radius.circular(10))),
            //       labelColor: Colors.white,
            //       labelStyle: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize:15,
            //       ),
            //       indicatorColor: Colors.black,
            //       tabs: <Widget>[
            //         Tab(
            //           icon: Text("QUESTIONS"),
            //         ),
            //         Tab(
            //           icon: Text("TRAFFIC SIGNS"),
            //         ),
            //
            //       ]),
            // ),
            Expanded(
                flex: 2,
                child: TabBarView(children: <Widget>[english(), traffic()]))
          ],
        ),
      ),
    );
  }

  TabBar get _tabBar => TabBar(
    tabs: [
      Tab(icon: Icon(Icons.call)),
      Tab(icon: Icon(Icons.message)),
    ],
  );
}
