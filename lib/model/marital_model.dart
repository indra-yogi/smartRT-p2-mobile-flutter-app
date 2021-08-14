import 'dart:convert';

List<Marital> maritalFromJson(String str) =>
    List<Marital>.from(json.decode(str)['record'].map((x) => Marital.fromJson(x)));

String maritalToJson(List<Marital> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Status> statusFromJson(String str) =>
    List<Status>.from(json.decode(str).map((x) => Status.fromJson(x)));

String statusToJson(List<Status> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Marital {
  Marital({
    this.id,
    this.maritalNumber,
    this.maritalSerial,
    this.marriedDate,
    this.marriedPlace,
    this.husbandName,
    this.husbandNik,
    this.husbandBirthPlace,
    this.husbandBirthDate,
    this.husbandNationality,
    this.husbandReligion,
    this.wifeName,
    this.wifeNik,
    this.wifeBirthPlace,
    this.wifeBirthDate,
    this.wifeNationality,
    this.wifeReligion,
    this.address,
    this.maritalAttachment,
    this.husbandAttachment,
    this.wifeAttachment,
    this.neighbourhoodId,
    this.status,
  });

  int id;
  String maritalNumber;
  String maritalSerial;
  String marriedDate;
  String marriedPlace;
  String husbandName;
  String husbandNik;
  String husbandBirthPlace;
  String husbandBirthDate;
  String husbandNationality;
  String husbandReligion;
  String wifeName;
  String wifeNik;
  String wifeBirthPlace;
  String wifeBirthDate;
  String wifeNationality;
  String wifeReligion;
  String address;
  String maritalAttachment;
  String husbandAttachment;
  String wifeAttachment;
  int neighbourhoodId;
  Status status;

  factory Marital.fromJson(Map<String, dynamic> parsedJson) => Marital(
    id: parsedJson["id"],
    maritalNumber: parsedJson["marital_number"],
    maritalSerial: parsedJson["marital_serial_number"],
    marriedDate: parsedJson["married_date"],
    marriedPlace: parsedJson["married_place"],
    husbandName: parsedJson["husband_name"],
    husbandNik: parsedJson["husband_nik"],
    husbandBirthDate: parsedJson["husband_birth_date"],
    husbandBirthPlace: parsedJson["husband_birth_place"],
    husbandNationality: parsedJson["husband_nationality"],
    husbandReligion: parsedJson["husband_religion"],
    wifeName: parsedJson["wife_name"],
    wifeNik: parsedJson["wife_nik"],
    wifeBirthDate: parsedJson["wife_birth_date"],
    wifeBirthPlace: parsedJson["wife_birth_place"],
    wifeNationality: parsedJson["wife_nationality"],
    wifeReligion: parsedJson["wife_religion"],
    address: parsedJson["address"],
    maritalAttachment: parsedJson["marital_attachment"],
    husbandAttachment: parsedJson["husband_marital_attachment"],
    wifeAttachment: parsedJson["wife_marital_attachment"],
    status: Status.fromJson(parsedJson["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "maritalNumber": maritalNumber,
    "maritalSerial": maritalSerial,
    "marriedDate": marriedDate,
    "marriedPlace": marriedPlace,
    "husbandName": husbandName,
    "husbandNik": husbandNik,
    "husbandBirthDate": husbandBirthDate,
    "husbandBirthPlace": husbandBirthPlace,
    "husbandNationality": husbandNationality,
    "husbandReligion": husbandReligion,
    "wifeName": wifeName,
    "wifeNik": wifeNik,
    "wifeBirthDate": wifeBirthDate,
    "wifeBirthPlace": wifeBirthPlace,
    "wifeNationality": wifeNationality,
    "wifeReligion": wifeReligion,
    "address": address,
    "maritalAttachment": maritalAttachment,
    "husbandAttachment": husbandAttachment,
    "wifeAttachment": wifeAttachment,
    "neigbourhoodId": neighbourhoodId,
    "status": status,
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