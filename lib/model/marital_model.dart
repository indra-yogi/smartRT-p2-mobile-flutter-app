import 'dart:convert';

List<Marital> maritalFromJson(String str) =>
    List<Marital>.from(json.decode(str).map((x) => Marital.fromJson(x)));

String maritalToJson(List<Marital> data) =>
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

  factory Marital.fromJson(Map<String, dynamic> json) => Marital(
    id: json["id"],
    maritalNumber: json["marital_number"],
    maritalSerial: json["marital_serial_number"],
    marriedDate: json["married_date"],
    marriedPlace: json["married_place"],
    husbandName: json["husband_name"],
    husbandNik: json["husband_nik"],
    husbandBirthDate: json["husband_birth_date"],
    husbandBirthPlace: json["husband_birth_place"],
    husbandNationality: json["husband_nationality"],
    husbandReligion: json["husband_religion"],
    wifeName: json["wife_name"],
    wifeNik: json["wife_nik"],
    wifeBirthDate: json["wife_birth_date"],
    wifeBirthPlace: json["wife_birth_place"],
    wifeNationality: json["wife_nationality"],
    wifeReligion: json["wife_religion"],
    address: json["address"],
    maritalAttachment: json["marital_attachment"],
    husbandAttachment: json["husband_marital_attachment"],
    wifeAttachment: json["wife_marital_attachment"],
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
  };
}