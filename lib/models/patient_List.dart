// To parse this JSON data, do
//
//     final patientList = patientListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PatientList patientListFromJson(String str) => PatientList.fromJson(json.decode(str));

String patientListToJson(PatientList data) => json.encode(data.toJson());

class PatientList {
  PatientList({
    required this.isSuccess,
    required this.statusCode,
    required this.message,
    required this.result,
  });

  final bool isSuccess;
  final int statusCode;
  final String message;
  final List<Result> result;

  factory PatientList.fromJson(Map<String, dynamic> json) => PatientList(
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
