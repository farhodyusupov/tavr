import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:tavr/models/patient_List.dart';
import 'package:tavr/providers/patient_info_provider.dart';
import 'package:tavr/screens/more_info_screen.dart';
import 'package:after_layout/after_layout.dart';
import 'package:tavr/widget/const.dart';
import 'package:tavr/widget/platform_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  late List<Result> patientInfoList;
  List<Result> searchlist = [];
  PatientInfoProvider? patientInfoProvider;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    patientInfoProvider = Provider.of<PatientInfoProvider>(context);

    return PlatformScaffold(

      body: Consumer<PatientInfoProvider>(
        builder: (context, value, child) {
          patientInfoList = value.patients;

          return Container(
            width: MediaQuery.of(context).size.width - 300,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(padding:EdgeInsets.only(left: 30),child: Text("Patient list", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                      Row(
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Colors.black12)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    BorderSide(color: Colors.black12)),
                              ),
                              controller: searchController,
                            ),
                          ),
                          const SizedBox(width: 20,),
                          GestureDetector(
                            onTap: () {
                              searchlist.clear();
                              print(
                                  "gesture working::${searchController.text}");
                              setState(() {
                                searchlist.addAll(patientInfoList.where(
                                        (element) =>
                                    element.mrn ==
                                        searchController.text));
                              });
                              print(searchlist[0].mrn);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Constants.mainColorLight),
                              child: Text("Search"),
                            ),
                          ),
                          const SizedBox(width: 30,)
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      color: Color.fromRGBO(237, 242, 251, 1),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  child: Text("MRN", style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 100,
                                  child: Text("Age", style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text("Gender", style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: searchlist.isEmpty?patientInfoList.map((patient) {
                                  int index = patientInfoList.indexOf(patient);
                                  return Container(
                                    color: index%2==0?Constants.lineColor1:Constants.lineColor2,
                                    padding: EdgeInsets.only(right: 30),
                                    height: 60,
                                    child:Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: 100,
                                          child: Text(patient.mrn),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 100,
                                          child: Text(patient.age.truncate().toString()),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 100,
                                          child: Text(patient.sex==0?"Male":"Female"),
                                        ),
                                        Expanded(child: Container(
                                          alignment: Alignment.centerRight,
                                          child: detailedInfoButton(patient),
                                        )),
                                      ],
                                    )
                                  );
                                }).toList():searchlist.map((searchPatient){
                                  int index = patientInfoList.indexOf(searchPatient);
                                  return Container(
                                      color: index%2==0?Constants.lineColor1:Constants.lineColor2,
                                      padding: EdgeInsets.only(right: 30),
                                      height: 60,
                                      child:Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            child: Text(searchPatient.mrn),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            child: Text(searchPatient.age.truncate().toString()),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            child: Text(searchPatient.sex==0?"Male":"Female"),
                                          ),
                                          Expanded(child: Container(
                                            alignment: Alignment.centerRight,
                                            child: detailedInfoButton(searchPatient),
                                          )),
                                        ],
                                      )
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
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
