import 'package:dio/dio.dart';

import '../models/patient_List.dart';

class HttpService {
  static const String baseUrl = "http://210.102.181.156:40007/tavr/patient";
  final dio = Dio();
  var response;

  Future<Response> networkRequest(
      {required String method, required String path, String? data}) {
    print("request is coming::");

    switch (method) {
      case "get":
        print("method:: $method");
        response = dio.get(
          "$baseUrl$path",
        );
        break;
      case "post":
        print("method:: $method");
        response = dio.post("$baseUrl$path");
        break;
      default:
        break;
    }
    return response;
  }

  Future<PatientList?> getPatientInfo() async {
    Response response = await dio.get("$baseUrl/list");

    if (response.statusCode == 200) {
      PatientList patientInfo = PatientList.fromJson(response.data);
      patientInfo.result.forEach((element) {
        print("patient:: ${element.mrn}::${element.age} ");
      });
      return patientInfo;
    }
    return null;
  }
}
