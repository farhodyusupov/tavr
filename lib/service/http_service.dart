import 'package:dio/dio.dart';

import '../models/patient_info.dart';

class HttpService{
  static const String baseUrl = "http://210.102.181.156:40007/tavr/patient";
  final dio = Dio();

  Future<PatientInfo?> getPatientInfo () async{
    Response response =  await dio.get("$baseUrl/list");

    if(response.statusCode ==200){
      PatientInfo patientInfo = PatientInfo.fromJson(response.data);
      patientInfo.result.forEach((element) {
        print("patient:: ${element.mrn}::${element.age} ");
      });
      return patientInfo;
    }
    return null;
  }


}