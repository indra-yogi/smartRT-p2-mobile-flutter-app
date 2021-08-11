import 'dart:convert';

List<Divorce> divorceFromJson(String str) =>
    List<Divorce>.from(json.decode(str)['record'].map((x) => Divorce.fromJson(x)));

String divorceToJson(List<Divorce> data) =>
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

  factory Divorce.fromJson(Map<String, dynamic> json) => Divorce(
    id: json["id"],
    divorceNumber: json["divorce_number"],
    maritalNumber: json["marital_number"],
    divorceSerial: json["divorce_serial_number"],
    divorceDate: json["divorce_date"],
    divorcePlace: json["divorce_place"],
    name: json["name"],
    nik: json["nik"],
    birthPlace: json["birth_place"],
    birthDate: json["birth_date"],
    religion: json["religion"],
    address: json["address"],
    attachment: json["attachment"],
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
  };
}