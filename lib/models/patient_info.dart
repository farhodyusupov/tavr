// To parse this JSON data, do
//
//     final patientInfo = patientInfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PatientInfo patientInfoFromJson(String str) => PatientInfo.fromJson(json.decode(str));

String patientInfoToJson(PatientInfo data) => json.encode(data.toJson());

class PatientInfo {
  PatientInfo({
    required this.isSuccess,
    required this.statusCode,
    required this.message,
    required this.result,
  });

  final bool isSuccess;
  final int statusCode;
  final String message;
  final List<Result> result;

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
    isSuccess: json["isSuccess"],
    statusCode: json["statusCode"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "statusCode": statusCode,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.mrn,
    required this.age,
    required this.sex,
  });

  final String mrn;
  final double age;
  final int sex;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    mrn: json["MRN"],
    age: json["Age"]?.toDouble(),
    sex: json["Sex"],
  );

  Map<String, dynamic> toJson() => {
    "MRN": mrn,
    "Age": age,
    "Sex": sex,
  };
}
