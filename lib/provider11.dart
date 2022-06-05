import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providerclass.dart';

class provider111 extends StatefulWidget {
  @override
  State<provider111> createState() => _provider111State();
}

class _provider111State extends State<provider111> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<getmyprovider>(
            create: (context) => getmyprovider(),
            child: Consumer<getmyprovider>(
              builder: (context, provider, child) {
                return SafeArea(                
                  child: Container(
                    height: 400,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          child: GridView.builder(
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  provider.box(index);
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: Center(
                                      child: Text(
                                    "${provider.list[index]}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                          ),
                        ),
                        Text("${provider.win}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Container(
                          height: 60,
                          width: 300,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    provider.Start();
                                  },
                                  child: Text(
                                    "   ${provider.abc}  ",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    provider.Restart();
                                  },
                                  child: Text(
                                    "${"Restart"}",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            )));
  }
}
