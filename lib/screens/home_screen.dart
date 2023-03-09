import 'package:tavr/data/dummy_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tavr/screens/more_info_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoreInfoScreen(
                      patientId: dummyList[index].id,
                    ),
                  ),
                );
              },
              child: Text(
                  "id: ${dummyList[index].id}   gender  ${dummyList[index].sex}   age   ${dummyList[index].age}, is web: $kIsWeb"),
            );
          },
        ),
      ),
    );
  }
}
