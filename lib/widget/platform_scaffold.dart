import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class PlatformScaffold extends StatefulWidget {
  Widget body;
  AppBar? appBar;
  PlatformScaffold({Key? key, required this.body, this.appBar}) : super(key: key);

  @override
  State<PlatformScaffold> createState() => _PlatformScaffoldState();
}

class _PlatformScaffoldState extends State<PlatformScaffold> {

  bool isMobile = false;
  bool isWindows = false;
  bool isWeb = false;

  @override
  void initState() {
    if(Platform.isAndroid||Platform.isIOS){
      isMobile = true;
    }else if(Platform.isWindows){
      isWindows = true;
    }else if(kIsWeb) {
      isWeb = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isMobile?widget.appBar??AppBar(title:const Text("AppBar"),):null,
      body: Container(
        child: widget.body,
      ),
    );
  }
}
