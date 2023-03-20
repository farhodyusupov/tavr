import 'package:dio/dio.dart';

import "../models/patient_info.dart";

import 'package:flutter/material.dart';
import '../service/http_service.dart';

class PatientInfoProvider extends ChangeNotifier {
  HttpService networkProvider = HttpService();

  List<Result> _patients = [];
  List<Result> get patients => _patients;

  Future<List<Result>?> getPatientInfo(String? data)async{
    Response? response = await networkProvider.networkRequest(method: "get", path: "/list");
   print("response data:: ${response?.data.toString()}");
    if(response?.statusCode==200) {
      PatientInfo patientInfo = PatientInfo.fromJson(response?.data);
    setPatientInfo(patientInfo.result);
    return patientInfo.result;
    }
  }

  void setPatientInfo(List<Result> patientList){
        _patients = patientList;

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
