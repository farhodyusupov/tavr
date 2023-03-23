import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:tavr/models/patient_List.dart';
import 'package:tavr/providers/patient_info_provider.dart';
import 'package:tavr/screens/more_info_screen.dart';
import 'package:after_layout/after_layout.dart';
import 'package:tavr/widget/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  List<Result>? patientInfoList;
  PatientInfoProvider? patientInfoProvider;

  @override
  Widget build(BuildContext context) {
    patientInfoProvider = Provider.of<PatientInfoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(204, 219, 253, 1),
        title: Row(
          children: [
            Container(
              width: 120,
              color: Constants.iconColor,
              height: AppBar().preferredSize.height,
            ),
            const SizedBox(width: 50,),
           const  Text("TAVR", style: TextStyle(color: Colors.black, fontSize: 25),)
          ],
        ),
      ),
      body: Consumer<PatientInfoProvider>(
        builder: (context, value, child) {
          print(value.patients);
          patientInfoList = value.patients;
          if (patientInfoList!.isEmpty) {
            return const Center(
              child: Text("there is no data"),
            );
          }
          return Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                  color: Color.fromRGBO(182, 204, 254, 1),
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const  Text("Doctor(or Manager)", style: TextStyle(fontSize: 20),),
                      const SizedBox(height: 15,),
                      Divider(height: 4,color: Colors.black,),
                      const SizedBox(height: 15,),
                      Text("Content", style: TextStyle(fontSize: 17, color: Colors.black),),
                      const SizedBox(height: 15,),
                      Text("Content", style: TextStyle(fontSize: 17, color: Colors.black),),
                      const SizedBox(height: 15,),
                      Text("Content", style: TextStyle(fontSize: 17, color: Colors.black),),
                    ],
                  ),
                ),
                Container(
                  color: Color.fromRGBO(215,227, 252, 1),
                  width: MediaQuery.of(context).size.width-300,
                  height: MediaQuery.of(context).size.height-AppBar().preferredSize.height,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: patientInfoList!.length,
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
                                children: const [
                                  SizedBox(
                                    width: 40,
                                    child: Text(
                                      "Id",
                                      style: TextStyle(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text("Gender"),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text("Age"),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: Text(
                                      patientInfoList![index].mrn ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                      patientInfoList![index].sex == 1
                                          ? "Male"
                                          : "Female"),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(patientInfoList![index].age
                                      .truncate()
                                      .toString()
                                  ),
                                ),
                                detailedInfoButton(
                                    patientInfoList![index] as Result)
                              ],
                            ),
                          ],
                        )
                            : Row(
                          children: [
                            SizedBox(
                              width: 40,
                              child:
                              Text(patientInfoList![index].mrn ),
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(patientInfoList![index].sex == 1
                                  ? "Male"
                                  : "Female"),
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(patientInfoList![index].age
                                  .truncate()
                                  .toString()),
                            ),
                            detailedInfoButton(
                                patientInfoList![index] as Result)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          );
        },
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    patientInfoProvider!.getPatientList();
    print("after first layout");
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
