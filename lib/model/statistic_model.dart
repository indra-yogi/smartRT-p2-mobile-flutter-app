
import 'dart:convert';

List<Statistic> statisticFromJson(String str) =>
    List<Statistic>.from(json.decode(str).map((x) => Statistic.fromJson(x)));

String statisticToJson(List<Statistic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Statistic {
  Statistic({
    this.totalData,
    this.divorce,
    this.marital,
  });

  String totalData;
  String divorce;
  String marital;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
    totalData: json["totalData"],
    divorce: json["divorce"],
    marital: json["marital"],
  );

  Map<String, dynamic> toJson() => {
    "totalData": totalData,
    "divorce": divorce,
    "marital": marital,
  };

}