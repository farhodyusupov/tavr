// To parse this JSON data, do
//
//     final patientInfo = patientInfoFromJson(jsonString);

import 'dart:convert';

PatientInfo patientInfoFromJson(String str) => PatientInfo.fromJson(json.decode(str));

String patientInfoToJson(PatientInfo data) => json.encode(data.toJson());

class PatientInfo {
  PatientInfo({
     this.isSuccess,
     this.statusCode,
     this.message,
     required this.result,
  });

  bool? isSuccess;
  int? statusCode;
  String? message;
  Patient result;

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
    isSuccess: json["isSuccess"],
    statusCode: json["statusCode"],
    message: json["message"],
    result: Patient.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "statusCode": statusCode,
    "message": message,
    "result": result.toJson(),
  };
}

class Patient {
  Patient({
     this.mrn,
     this.pacemakerImplatation,
     this.age,
     this.sex,
     this.bsa,
     this.bmi,
     this.htn,
     this.cad,
     this.dm,
     this.copd,
     this.af,
     this.pvd,
     this.cva,
     this.hemodialysis,
     this.previousHeartSergery,
     this.sympomaticAs,
     this.acEiArb,
     this.betaBlocker,
     this.aldosteroneantagonist,
     this.ccb,
     this.antiPlateletotherthanAsa,
     this.asa,
     this.antiPlateletTherapy,
     this.diuretics,
     this.lvef,
     this.systolicBp,
     this.diastolicBp,
     this.lvot,
     this.valveCode,
     this.valveSize,
     this.baselineRhythm,
     this.pr,
     this.qrs,
     this.qrSmorethan120,
     this.firstdegreeAVblock,
     this.baselineConductionDisorder,
     this.baselineRbbb,
     this.deltaPr,
     this.deltaQrs,
     this.newOnsetRbbb,
  });

  String? mrn;
  bool? pacemakerImplatation;
  double? age;
  int? sex;
  double? bsa;
  double? bmi;
  bool? htn;
  bool? cad;
  bool? dm;
  bool? copd;
  bool? af;
  bool? pvd;
  bool? cva;
  bool? hemodialysis;
  bool? previousHeartSergery;
  bool? sympomaticAs;
  bool? acEiArb;
  bool? betaBlocker;
  bool? aldosteroneantagonist;
  bool? ccb;
  bool? antiPlateletotherthanAsa;
  bool? asa;
  bool? antiPlateletTherapy;
  bool? diuretics;
  int? lvef;
  int? systolicBp;
  int? diastolicBp;
  int? lvot;
  int? valveCode;
  int? valveSize;
  int? baselineRhythm;
  int? pr;
  int? qrs;
  bool? qrSmorethan120;
  bool? firstdegreeAVblock;
  bool? baselineConductionDisorder;
  bool? baselineRbbb;
  int? deltaPr;
  int? deltaQrs;
  bool? newOnsetRbbb;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    mrn: json["MRN"],
    pacemakerImplatation: json["PacemakerImplatation"],
    age: json["Age"]?.toDouble(),
    sex: json["Sex"],
    bsa: json["BSA"]?.toDouble(),
    bmi: json["BMI"]?.toDouble(),
    htn: json["HTN"],
    cad: json["CAD"],
    dm: json["DM"],
    copd: json["COPD"],
    af: json["AF"],
    pvd: json["PVD"],
    cva: json["CVA"],
    hemodialysis: json["hemodialysis"],
    previousHeartSergery: json["PreviousHeartSergery"],
    sympomaticAs: json["SympomaticAs"],
    acEiArb: json["ACEi_ARB"],
    betaBlocker: json["Beta_Blocker"],
    aldosteroneantagonist: json["Aldosteroneantagonist"],
    ccb: json["CCB"],
    antiPlateletotherthanAsa: json["AntiPlateletotherthanASA"],
    asa: json["ASA"],
    antiPlateletTherapy: json["AntiPlateletTherapy"],
    diuretics: json["Diuretics"],
    lvef: json["LVEF"],
    systolicBp: json["SystolicBP"],
    diastolicBp: json["DiastolicBP"],
    lvot: json["LVOT"],
    valveCode: json["ValveCode"],
    valveSize: json["ValveSize"],
    baselineRhythm: json["BaselineRhythm"],
    pr: json["PR"],
    qrs: json["QRS"],
    qrSmorethan120: json["QRSmorethan120"],
    firstdegreeAVblock: json["FirstdegreeAVblock"],
    baselineConductionDisorder: json["Baseline_conduction_disorder"],
    baselineRbbb: json["BaselineRBBB"],
    deltaPr: json["DeltaPR"],
    deltaQrs: json["DeltaQRS"],
    newOnsetRbbb: json["New_Onset_RBBB"],
  );

  Map<String, dynamic> toJson() => {
    "MRN": mrn,
    "PacemakerImplatation": pacemakerImplatation,
    "Age": age,
    "Sex": sex,
    "BSA": bsa,
    "BMI": bmi,
    "HTN": htn,
    "CAD": cad,
    "DM": dm,
    "COPD": copd,
    "AF": af,
    "PVD": pvd,
    "CVA": cva,
    "hemodialysis": hemodialysis,
    "PreviousHeartSergery": previousHeartSergery,
    "SympomaticAs": sympomaticAs,
    "ACEi_ARB": acEiArb,
    "Beta_Blocker": betaBlocker,
    "Aldosteroneantagonist": aldosteroneantagonist,
    "CCB": ccb,
    "AntiPlateletotherthanASA": antiPlateletotherthanAsa,
    "ASA": asa,
    "AntiPlateletTherapy": antiPlateletTherapy,
    "Diuretics": diuretics,
    "LVEF": lvef,
    "SystolicBP": systolicBp,
    "DiastolicBP": diastolicBp,
    "LVOT": lvot,
    "ValveCode": valveCode,
    "ValveSize": valveSize,
    "BaselineRhythm": baselineRhythm,
    "PR": pr,
    "QRS": qrs,
    "QRSmorethan120": qrSmorethan120,
    "FirstdegreeAVblock": firstdegreeAVblock,
    "Baseline_conduction_disorder": baselineConductionDisorder,
    "BaselineRBBB": baselineRbbb,
    "DeltaPR": deltaPr,
    "DeltaQRS": deltaQrs,
    "New_Onset_RBBB": newOnsetRbbb,
  };
}
