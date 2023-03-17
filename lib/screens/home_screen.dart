import 'package:tavr/data/dummy_data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:tavr/models/patient_info.dart';
import 'package:tavr/screens/more_info_screen.dart';
import 'package:tavr/widget/const.dart';
import '../service/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: HttpService().getPatientInfo(),
        builder: (context, snapshot){
          return Container(
            padding: const EdgeInsets.all(50),
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: snapshot.data?.result.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Constants.lineColor1
                          : Constants.lineColor2),
                  child: index == 0
                      ? Column(
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              child: Text(
                                "Id",
                                style: TextStyle(),
                              ),
                            ),
                            Container(
                              width: 100,
                              child: Text("Gender"),
                            ),
                            Container(
                              width: 100,
                              child: Text("Age"),
                            ),
                            const SizedBox(
                              width: 100,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            child: Text(snapshot.data?.result[index].mrn??""),
                          ),
                          Container(
                            width: 100,
                            child: Text(snapshot.data?.result[index].sex==1?"Male":"Female"),
                          ),
                          Container(
                            width: 100,
                            child: Text(snapshot.data?.result[index].age.truncate().toString()??""),
                          ),
                          detailedInfoButton(snapshot.data?.result[index] as Result)
                        ],
                      ),
                    ],
                  )
                      : Row(
                    children: [
                      Container(
                        width: 40,
                        child: Text(snapshot.data?.result[index].mrn??""),
                      ),
                      Container(
                        width: 100,
                        child: Text(snapshot.data?.result[index].sex==1?"Male":"Female"),
                      ),
                      Container(
                        width: 100,
                        child: Text(snapshot.data?.result[index].age.truncate().toString()??""),
                      ),
                      detailedInfoButton(snapshot.data?.result[index] as Result )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget detailedInfoButton(Result patient) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MoreInfoScreen(patient: patient)));
      },
      child: Container(
        height: 40,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlue.shade500),
        child: Text("detailed info"),
      ),
    );
  }
}
