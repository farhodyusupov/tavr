import 'package:provider/provider.dart';
import 'package:tavr/data/dummy_data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:tavr/models/patient_info.dart';
import 'package:tavr/providers/patient_info_provider.dart';
import 'package:tavr/screens/more_info_screen.dart';
import 'package:tavr/widget/const.dart';
import '../service/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 List<Result>? patientInfoList;
 PatientInfoProvider? patientInfoProvider;

  @override
  Widget build(BuildContext context) {
    patientInfoProvider = Provider.of<PatientInfoProvider>(context);
    return Scaffold(
      body: Consumer<PatientInfoProvider>(
        builder: (context, value, child) {
         patientInfoList = value.patients;
         if(patientInfoList!.isEmpty){
           return Center(child: Text("there is no data"),);
         }
         return Center(child: Text("data is coming"),);
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
