import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'const.dart';

class PlatformScaffold extends StatefulWidget {
  Widget body;
  AppBar? appBar;

  PlatformScaffold({Key? key, required this.body, this.appBar})
      : super(key: key);

  @override
  State<PlatformScaffold> createState() => _PlatformScaffoldState();
}

class _PlatformScaffoldState extends State<PlatformScaffold> {
  bool isMobile = false;
  bool isWindows = false;
  bool isWeb = false;
  @override
  void initState() {
    if (Platform.isAndroid || Platform.isIOS) {
      isMobile = true;
      print("platform:: mobile");
    } else if (Platform.isWindows) {
      isWindows = true;
      print("platform:: windows");
    } else if (kIsWeb) {
      print("platform:: Web");

      isWeb = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool isTablet = shortestSide>600;
    print("isTablet: $isTablet");
    return Scaffold(
        drawer: !isTablet?Drawer(
          child: Container(
            padding: EdgeInsets.all(50),
            color: Color.fromRGBO(182, 204, 254, 1),
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Doctor(or Manager)",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 4,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Content",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Content",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Content",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ],
            ),
          ),
        ):SizedBox(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(204, 219, 253, 1),
          title: Row(
            children: [
              Container(
                width: 120,
                color: Constants.iconColor,
                height: AppBar().preferredSize.height,
              ),
              const SizedBox(
                width: 50,
              ),
              const Text(
                "TAVR",
                style: TextStyle(color: Colors.black, fontSize: 25),
              )
            ],
          ),
        ),
        body: Container(
          child: Row(
            children: [
              !isTablet?SizedBox():
              Container(
                padding: EdgeInsets.all(50),
                color: Color.fromRGBO(182, 204, 254, 1),
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Doctor(or Manager)",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      height: 4,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Content",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Content",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Content",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ],
                ),
              ),
             !isTablet?widget.body:Container(
               width: MediaQuery.of(context).size.width-300,
               child:              widget.body,
             ),
            ],
          ),
        ));
  }
}
