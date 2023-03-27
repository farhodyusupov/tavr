// To parse this JSON data, do
//
//     final ppi = ppiFromJson(jsonString);

import 'dart:convert';

class Ppi {
  Ppi({
    this.isSuccess,
    this.statusCode,
    this.message,
    this.result,
  });

  bool? isSuccess;
  int? statusCode;
  String? message;
  String? result;

  factory Ppi.fromRawJson(String str) => Ppi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ppi.fromJson(Map<String, dynamic> json) => Ppi(
    isSuccess: json["isSuccess"],
    statusCode: json["statusCode"],
    message: json["message"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "statusCode": statusCode,
    "message": message,
    "result": result,
  };
}
