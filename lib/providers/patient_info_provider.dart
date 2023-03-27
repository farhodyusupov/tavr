import 'package:dio/dio.dart';

import "../models/patient_List.dart";
import '../models/patient_info.dart';
import 'package:flutter/material.dart';
import '../models/ppi_info.dart';
import '../service/http_service.dart';

class PatientInfoProvider extends ChangeNotifier {
  HttpService networkProvider = HttpService();

  List<Result> _patients = [];

  List<Result> get patients => _patients;

  List<Info> _patient = [];

  List<Info> get patient => _patient;

  Ppi _ppi =Ppi();

  Ppi get ppi => _ppi;

  Future<List<Result>?> getPatientList() async {
    Response response =
        await networkProvider.networkRequest(method: "get", path: "/list");
    if (response.statusCode == 200) {
      PatientList patientInfo = PatientList.fromJson(response.data);
      setPatientInfo(patientInfo.result);
      patientInfo.result.forEach((element) {
        print(element.sex);
      });
      return patientInfo.result;
    }
    return null;
  }

  void setPatientInfo(List<Result> patientList) {
    _patients = patientList;
    notifyListeners();
  }

  Future<PatientInfo?>? getPatient() async {
    Response response =
        await networkProvider.networkRequest(method: "post", path: "/inform",data: {"MRN":"02006901"});
    print("statusCode:: ${response.statusCode}");
    if (response.statusCode == 201) {
      PatientInfo patient = PatientInfo.fromJson(response.data);
      if(!patient.result.isEmpty){
        setPatient(patient.result);
      }
    }
  }

  void setPatient(List<Info> patientInfo) {
    _patient = patientInfo;
    notifyListeners();
  }

  Future<Ppi?>? getPPIResult() async {
    print("ppi");

    Response response =
        await networkProvider.networkRequest(method: "post", path: "/PPI", data: {"MRN":"02006901"});
    print("ppi");
    print(response.statusCode);
    if (response.statusCode == 201) {
      Ppi ppi = Ppi.fromJson(response.data);
      print("ppi result:: ${ppi.result}");
      setPPI(ppi);
    }
  }


  void setPPI(Ppi ppi){
    _ppi = ppi;
    notifyListeners();
  }
}
