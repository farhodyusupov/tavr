// To parse this JSON data, do
//
//     final patientInfo = patientInfoFromJson(jsonString);

import 'dart:convert';

PatientInfo patientInfoFromJson(String str) => PatientInfo.fromJson(json.decode(str));

String patientInfoToJson(PatientInfo data) => json.encode(data.toJson());

class PatientInfo {
  PatientInfo({
    this.isSuccess,
    this.stateCode,
    this.message,
    required this.result,
  });

  bool? isSuccess;
  int? stateCode;
  String? message;
  List<Info> result;

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
    isSuccess: json["isSuccess"],
    stateCode: json["stateCode"],
    message: json["message"],
    result: json["result"] == null ? [] : List<Info>.from(json["result"]!.map((x) => Info.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "stateCode": stateCode,
    "message": message,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Info {
  Info({
    this.mrn,
    this.pacemakerImplantation,
    this.ppMdays,
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
    this.previousHeartSurgeryIntervention,
    this.symptomaticAs,
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
    this.newOnsetLbbb,
  });

  String? mrn;
  int? pacemakerImplantation;
  String? ppMdays;
  double? age;
  int? sex;
  double? bsa;
  double? bmi;
  int? htn;
  int? cad;
  int? dm;
  int? copd;
  int? af;
  int? pvd;
  int? cva;
  int? hemodialysis;
  int? previousHeartSurgeryIntervention;
  int? symptomaticAs;
  int? acEiArb;
  int? betaBlocker;
  int? aldosteroneantagonist;
  int? ccb;
  int? antiPlateletotherthanAsa;
  int? asa;
  int? antiPlateletTherapy;
  int? diuretics;
  int? lvef;
  int? systolicBp;
  int? diastolicBp;
  int? lvot;
  int? valveCode;
  int? valveSize;
  int? baselineRhythm;
  int? pr;
  int? qrs;
  int? qrSmorethan120;
  int? firstdegreeAVblock;
  int? baselineConductionDisorder;
  int? baselineRbbb;
  int? deltaPr;
  int? deltaQrs;
  int? newOnsetLbbb;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    mrn: json["MRN"],
    pacemakerImplantation: json["PacemakerImplantation"],
    ppMdays: json["PPMdays"],
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
    hemodialysis: json["Hemodialysis"],
    previousHeartSurgeryIntervention: json["PreviousHeartSurgery_Intervention"],
    symptomaticAs: json["SymptomaticAS"],
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
    newOnsetLbbb: json["New_Onset_LBBB"],
  );

  Map<String, dynamic> toJson() => {
    "MRN": mrn,
    "PacemakerImplantation": pacemakerImplantation,
    "PPMdays": ppMdays,
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
    "Hemodialysis": hemodialysis,
    "PreviousHeartSurgery_Intervention": previousHeartSurgeryIntervention,
    "SymptomaticAS": symptomaticAs,
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
    "New_Onset_LBBB": newOnsetLbbb,
  };
}
