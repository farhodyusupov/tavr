import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tavr/data/dummy_data.dart';
import 'package:tavr/models/patient_List.dart';
import 'package:tavr/providers/patient_info_provider.dart';
import 'package:tavr/widget/const.dart';
import 'package:tavr/widget/platform_scaffold.dart';
import '../models/patient_info.dart';
import '../models/ppi_info.dart';

class MoreInfoScreen extends StatefulWidget {
  Result patient;

  MoreInfoScreen({Key? key, required this.patient}) : super(key: key);

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen>
    with AfterLayoutMixin<MoreInfoScreen> {
  PatientInfoProvider? patientInfoProvider;
  Patient? patient;
  Ppi? ppi;

  bool isMobile = false;
  bool isWindows = false;
  bool isWeb = false;

  @override
  void initState() {
    if (Platform.isAndroid || Platform.isIOS) {
      isMobile = true;
    } else if (Platform.isWindows) {
      isWindows = true;
    } else {
      isWeb = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    patientInfoProvider = Provider.of<PatientInfoProvider>(context);

    return Consumer<PatientInfoProvider>(builder: (context, value, child) {
      patient = value.patient as Patient?;
      if (patient == null) {
        return CircularProgressIndicator();
      }
      return PlatformScaffold(
        body: Container(
          width: MediaQuery.of(context).size.width - 300,
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Patient info",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    width: 400,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    Text(
                                      "MRN:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "AGE:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "PaceMaker Implantation:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "BSA:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "BMI:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "HTN:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "CAD:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "DM:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "COPD:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "AF:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "PVD:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "CVA:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Hemodialysis:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "PreviousHeartSergery:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "SympomaticAs:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "ACEi_ARB:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Beta_Blocker:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Aldosteroneantagonist:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "CCB:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "AntiPlateletotherthanASA:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "ASA:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "AntiPlateletTherapy:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Diuretics:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "LVEF:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "SystolicBP:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "DiastolicBP:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "LVOT:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "ValveSize:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "BaselineRhythm:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "PR:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "QRS:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "QRSmorethan120:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "FirstdegreeAVblock:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "Baseline_conduction_disorder:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "BaselineRBBB:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "DeltaPR:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "New_Onset_RBBBs:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      patient!.mrn.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.age!.truncate().toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.pacemakerImplatation.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.bsa.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.bmi.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.htn.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.cad.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.dm.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.copd.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.af.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.pvd.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.cva.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.hemodialysis.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.previousHeartSergery.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.sympomaticAs.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.acEiArb.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.betaBlocker.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.aldosteroneantagonist.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.ccb.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.antiPlateletotherthanAsa
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.asa.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.antiPlateletTherapy.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.diuretics.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.lvef.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.systolicBp.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.diastolicBp.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.lvot.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.valveSize.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.baselineRhythm.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.pr.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.qrs.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.qrSmorethan120.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.firstdegreeAVblock.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.baselineConductionDisorder
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.baselineRbbb.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.deltaPr.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      patient!.newOnsetRbbb.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      PPIresult();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Constants.buttonColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text("PPI"),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Constants.pinkColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text("back"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    patientInfoProvider!.getPatient();
    patientInfoProvider!.getPPIResult();
  }
  void PPIresult() {
    showDialog(
      context: (context),
      builder: (BuildContext context) {
        return AlertDialog(
          content: Consumer<PatientInfoProvider>(
            builder: (context, value, child) {
              ppi =  value.ppi;
              return Container(
                child: Text(ppi!.result.toString()),
              );
            },
          ),
        );
      },
    );
  }
}
