import 'dart:io';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class rc_info extends StatefulWidget {
  const rc_info({Key? key}) : super(key: key);

  @override
  State<rc_info> createState() => _rc_infoState();
}

class _rc_infoState extends State<rc_info> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmyhtmldata();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RC Information"),
      ),
    body: WebView(initialUrl: "${document}",javascriptMode: JavascriptMode.unrestricted,),);
  }
  var document;
  void getmyhtmldata() {

    String myhtml="asset/rc1.html";
     document=parse(myhtml);
    print("==========${document.outerHtml}");
    print("111====${document.getElementById("dash")?.innerHtml}");
  }
  
}
