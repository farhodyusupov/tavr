import 'package:dio/dio.dart';

import "../models/patient_List.dart";
import '../models/patient_info.dart';
import 'package:flutter/material.dart';
import '../service/http_service.dart';

class PatientInfoProvider extends ChangeNotifier {
  HttpService networkProvider = HttpService();

  List<Result> _patients = [];
  List<Result> get patients => _patients;

  Patient _patient = Patient();
  Patient get patient => _patient;

  Future<List<Result>?> getPatientList()async{
    Response response = await networkProvider.networkRequest(method: "get", path: "/list");
    if(response.statusCode==200) {
      PatientList patientInfo = PatientList.fromJson(response.data);
    setPatientInfo(patientInfo.result);
    return patientInfo.result;
    }
    return null;
  }

  void setPatientInfo(List<Result> patientList){
        _patients = patientList;
        notifyListeners();
  }

  Future<Patient?>? getPatient()async{
    print("patient is getting fetch");
    Response response = await networkProvider.networkRequest(method: "post", path: "/inform" );
    print("request code:: ${response.statusCode}");
    if(response.statusCode == 200){
      print("patient fetch is done");
      Patient patient = Patient.fromJson(response.data);
      print("patient info::${patient.mrn}");
      return patient;
    }

  }
  void setPatient(Patient patientInfo){
    _patient = patientInfo;
    notifyListeners();
  }
  /*
  Future<OrderInfo?> selectOrderList(int page, Map<String, dynamic> data) async{
    Response response = await _networkComponent.shared.request('get', '/order', data);
    if(response.success){
      OrderInfo orderInfo = OrderInfo.fromJson(response.data);
      setOrderList(page, orderInfo.orderList);
      return orderInfo;
    }
  }

  void setOrderList(int page, List<Order> orderList){
    if(page == 1){
      _orderList = orderList;
    }else{
      _orderList.addAll(orderList);
    }

    notifyListeners();
  }
  * */
}
