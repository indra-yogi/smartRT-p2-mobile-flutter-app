import 'dart:convert';

List<Divorce> divorceFromJson(String str) =>
    List<Divorce>.from(json.decode(str)['record'].map((x) => Divorce.fromJson(x)));

String divorceToJson(List<Divorce> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Status> statusFromJson(String str) =>
    List<Status>.from(json.decode(str).map((x) => Status.fromJson(x)));

String statusToJson(List<Status> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Divorce {
  Divorce({
    this.id,
    this.divorceNumber,
    this.maritalNumber,
    this.divorceSerial,
    this.divorceDate,
    this.divorcePlace,
    this.name,
    this.nik,
    this.birthPlace,
    this.birthDate,
    this.religion,
    this.address,
    this.attachment,
    this.status,
});

  int id;
  String divorceNumber;
  String maritalNumber;
  String divorceSerial;
  String divorceDate;
  String divorcePlace;
  String name;
  String nik;
  String birthPlace;
  String birthDate;
  String religion;
  String address;
  String attachment;
  Status status;

  factory Divorce.fromJson(Map<String, dynamic> parsedJson) => Divorce(
    id: parsedJson["id"],
    divorceNumber: parsedJson["divorce_number"],
    maritalNumber: parsedJson["marital_number"],
    divorceSerial: parsedJson["divorce_serial_number"],
    divorceDate: parsedJson["divorce_date"],
    divorcePlace: parsedJson["divorce_place"],
    name: parsedJson["name"],
    nik: parsedJson["nik"],
    birthPlace: parsedJson["birth_place"],
    birthDate: parsedJson["birth_date"],
    religion: parsedJson["religion"],
    address: parsedJson["address"],
    attachment: parsedJson["attachment"],
    status: Status.fromJson(parsedJson["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "divorceNumber": divorceNumber,
    "maritalNumber": maritalNumber,
    "divorceSerial": divorceSerial,
    "divorceDate": divorceDate,
    "divorcePlace": divorcePlace,
    "name": name,
    "nik": nik,
    "birthPlace": birthPlace,
    "birthDate": birthDate,
    "religion": religion,
    "address": address,
    "attachment": attachment,
    "status": status
  };
}

class Status {
  Status({
    this.id,
    this.status
  });

  int id;
  String status;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    id: json["id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
  };
}