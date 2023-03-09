import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tavr/data/dummy_data.dart';

class MoreInfoScreen extends StatefulWidget {
  final int patientId;

  const MoreInfoScreen({Key? key, required this.patientId}) : super(key: key);

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  late DummyData dummy;

  @override
  void initState() {
    dummy = dummyList.firstWhere((element) => element.id == widget.patientId);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid){
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("detailed info of patent on Android"),

            Text("id: ${dummy.id}   gender  ${dummy.sex}   age   ${dummy.age}"),
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
                          return AlertDialog(
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

            Text("id: ${dummy.id}   gender  ${dummy.sex}   age   ${dummy.age}"),
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
                          return AlertDialog(
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
    }else if(kIsWeb){
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("detailed info of patent other platforms"),

            Text("id: ${dummy.id}   gender  ${dummy.sex}   age   ${dummy.age}"),
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
                          return AlertDialog(
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
      return Scaffold(
        body: Container(child:Text("other platforms")),
      );
    }

  }
}
