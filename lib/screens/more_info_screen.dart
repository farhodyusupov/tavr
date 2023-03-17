import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tavr/data/dummy_data.dart';
import 'package:tavr/models/patient_info.dart';

class MoreInfoScreen extends StatefulWidget {
  Result  patient;

  MoreInfoScreen({Key? key, required this.patient}) : super(key: key);

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {

  bool isMobile = false;
  bool isWindows = false;
  bool isWeb = false;


  @override
  void initState() {
    if(Platform.isAndroid||Platform.isIOS){
      isMobile = true;
    }else if(Platform.isWindows){
      isWindows = true;
    }else {
      isWeb = true;
    }

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    if(isMobile){
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("detailed info of patent on Mobile"),

            Text("id: ${widget.patient.mrn }   gender  ${widget.patient.sex}   age   ${widget.patient.age.truncate()}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("back"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: (context),
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            content: Text("result of PPI"),
                          );
                        });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("PPI"),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }else if(Platform.isWindows){
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("detailed info of patent on other Windows"),

            Text("id: ${widget.patient.mrn}   gender  ${widget.patient.sex}   age   ${widget.patient.age.truncate()}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("back"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: (context),
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            content: Text("result of PPI"),
                          );
                        });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("PPI"),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }else if(isWeb){
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("detailed info of patent other platforms"),

            Text("id: ${widget.patient.mrn}   gender  ${widget.patient.sex}   age   ${widget.patient.age.truncate()}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("back"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: (context),
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            content: Text("result of PPI"),
                          );
                        });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("PPI"),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }else{
      return const Scaffold(
        body:  Text("other platforms"),
      );
    }

  }
}
